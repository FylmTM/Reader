use rocket::fairing::{Fairing, Info, Kind};
use rocket::{Request, Response};

pub struct AppHeaders();

impl Fairing for AppHeaders {
    fn info(&self) -> Info {
        Info {
            name: "Application Headers",
            kind: Kind::Response,
        }
    }

    fn on_response(&self, _request: &Request, response: &mut Response) {
        response.set_raw_header(
            "Content-Security-Policy",
            "default-src 'none'; script-src 'self' 'unsafe-inline'; connect-src 'self'; img-src *; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com",
        );
    }
}
