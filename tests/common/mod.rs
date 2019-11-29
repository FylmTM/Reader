use rocket::local::Client;

use reader;

pub fn client() -> Client {
    let app = reader::app(true);
    Client::new(app).expect("failed to construct rocket client")
}
