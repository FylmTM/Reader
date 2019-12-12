use std::thread;
use std::time::Duration;

use crate::db::{self, Queries};
use crate::error::{ApplicationError, Error, Result};

pub mod atom;
pub mod rss;
pub mod utils;

pub fn initialize(pool: &db::Pool, interval: u64) {
    let pool = pool.clone();

    info!("Schedule feeds update every {} minutes.", interval);
    thread::spawn(move || loop {
        thread::sleep(Duration::from_secs(5));
        loop {
            let mut conn = pool.get().expect("Failed to acquire db connection");
            update(&mut conn);

            info!("Next feed update in {} minutes.", interval);
            thread::sleep(Duration::from_secs(60 * interval));
        }
    });
}

pub fn update(mut conn: &mut db::Connection) {
    info!("Feeds update started.");
    match conn.find_feeds() {
        Ok(feeds) => {
            for feed in feeds {
                match update_feed(&mut conn, &feed) {
                    Ok(_) => debug!("{:?} feed updated.", feed),
                    Err(error) => error!("{:?} feed failed to update: {:?}", feed, error),
                };
            }
        }
        Err(error) => {
            error!("Failed to retrieve feeds: {:?}.", error);
        }
    }
    info!("Feeds update completed.");
}

pub fn update_feed(conn: &mut db::Connection, feed: &db::Feed) -> Result<()> {
    debug!("{:?} update started.", feed);

    let user_ids = conn.find_user_ids_by_feed(feed.id)?;
    if user_ids.is_empty() {
        debug!("{:?} does not belong to any user, skip update.", feed);
        return Ok(());
    }

    let posts = match feed.kind {
        db::FeedKind::RSS => rss::update(&feed),
        db::FeedKind::Atom => atom::update(&feed),
    }?;

    save_posts(conn, feed, &posts, &user_ids)?;

    Ok(())
}

fn save_posts(
    conn: &mut db::Connection,
    feed: &db::Feed,
    posts: &Vec<db::Post>,
    user_ids: &Vec<db::UserId>,
) -> Result<()> {
    for post in posts {
        let tx = conn.transaction()?;
        match tx.save_post(feed.id, &post) {
            Ok(post_id) => {
                debug!("{:?} saved.", post);
                for user_id in user_ids {
                    tx.save_user_post(*user_id, post_id)?;
                }
                tx.commit()?;
            }
            Err(Error::App(ApplicationError::QueryEntityAlreadyExists)) => {
                debug!("{:?} already exists.", &post)
            }
            Err(error) => return Err(error),
        }
    }
    Ok(())
}
