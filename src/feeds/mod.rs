use std::thread;
use std::time::Duration;

use crate::db::{self, Queries};

pub mod rss;
pub mod utils;

pub fn initialize(pool: &db::Pool, interval: u64) {
    let pool = pool.clone();
    info!("Schedule feeds update every {} minutes.", interval);

    thread::spawn(move || loop {
        loop {
            let mut conn = pool.clone().get().expect("Failed to acquire db connection");
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
                debug!("{:?} update started.", feed);

                let result = match feed.kind {
                    db::FeedKind::RSS => rss::update(&mut conn, &feed),
                };
                match result {
                    Ok(_) => debug!("{:?} updated.", feed),
                    Err(error) => error!("{:?} failed to update: {:?}.", feed, error),
                };
            }
        }
        Err(error) => {
            error!("Failed to retrieve feeds: {:?}.", error);
        }
    }
    info!("Feeds update completed.");
}
