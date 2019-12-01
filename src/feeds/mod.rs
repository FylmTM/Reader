pub mod rss;

use crate::db;
use std::thread;
use std::time::Duration;

pub fn initialize(pool: &db::Pool, interval: u64) {
    let pool = pool.clone();
    info!("Schedule feeds update every {} minutes.", interval);

    thread::spawn(move || loop {
        loop {
            info!("Feeds update started.");
            let conn = pool.clone().get().expect("Failed to acquire db connection");

            match db::find_feeds(&conn) {
                Ok(feeds) => {
                    for feed in feeds {
                        info!(
                            "Feed[id={}, kind={:?}, title={}] update started.",
                            feed.id, feed.kind, feed.title
                        );

                        let result = match feed.kind {
                            db::FeedKind::RSS => rss::update(&conn, &feed),
                        };
                        match result {
                            Ok(_) => info!(
                                "Feed[id={}, kind={:?}, title={}] updated.",
                                feed.id, feed.kind, feed.title
                            ),
                            Err(error) => error!("Failed to update {:?}: {:?}.", feed, error),
                        };
                    }
                }
                Err(error) => {
                    error!("Failed to retrieve feeds: {:?}.", error);
                }
            }

            info!("Feeds update completed. Next in {} minutes.", interval);
            thread::sleep(Duration::from_secs(60 * interval));
        }
    });
}
