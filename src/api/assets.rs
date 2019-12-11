use std::borrow::Cow;
use std::ffi::OsStr;
use std::io::Cursor;
use std::path::{Path, PathBuf};

use rocket::http::ContentType;
use rocket::request::FromRequest;
use rocket::response;
use rocket::{Outcome, Request};

use crate::error::Error as E;

#[cfg(debug_assertions)]
#[derive(RustEmbed)]
#[folder = "static"]
struct Assets;

#[cfg(not(debug_assertions))]
#[derive(RustEmbed)]
#[folder = "app/build"]
struct Assets;

const INDEX: &str = "index.html";

pub struct Asset {
    content: Cow<'static, [u8]>,
    content_type: Option<ContentType>,
    is_gzipped: bool,
}

/// Serve bundled assets (frontend app).
/// Also check if there are gzipped version of assets available,
/// and serve those instead of original with appropriate headers.
///
/// All requests to /api will be silently forwarded on.
impl<'a, 'r> FromRequest<'a, 'r> for Asset {
    type Error = E;

    fn from_request(request: &'a Request<'r>) -> rocket::request::Outcome<Self, E> {
        let path_raw = request.uri().path();

        // Do not try to serve assets for API.
        if path_raw.starts_with("/api") {
            return Outcome::Forward(());
        }

        let path = if path_raw == "/" {
            INDEX
        } else {
            if Path::new(path_raw).extension().is_none() {
                // Fallback all URL's that does not possibly represent file to index.html.
                // Required to support HTML5 history API for SPA application.
                INDEX
            } else {
                // We need to remove first '/' from url path, because assets paths are relative.
                &path_raw[1..]
            }
        };

        let accept_gzip = request
            .headers()
            .get_one("Accept-Encoding")
            .map_or(false, |value| value.contains("gzip"));

        // Attempt to get gzipped asset version, otherwise fallback to normal asset.
        let file_lookup: (bool, Option<Cow<'static, [u8]>>) = if accept_gzip {
            let gzipped_path = path.to_string() + ".gz";
            let file: Option<Cow<'static, [u8]>> = Assets::get(&gzipped_path);
            if file.is_some() {
                (true, file)
            } else {
                (false, Assets::get(&path))
            }
        } else {
            (false, Assets::get(&path))
        };

        let (is_gzipped, file) = file_lookup;

        let file_path = Path::new(path);
        let extension = file_path
            .extension()
            .and_then(OsStr::to_str)
            .expect("Asset extension must be present.");
        let content_type: Option<ContentType> = ContentType::from_extension(extension);

        file.map_or_else(
            || {
                debug!("Asset does not exist, forward request path={}.", path);
                Outcome::Forward(())
            },
            |content| {
                debug!("Serve asset path={}.", path);
                Outcome::Success(Asset {
                    content,
                    content_type,
                    is_gzipped,
                })
            },
        )
    }
}

#[get("/", rank = 98)]
pub fn index<'r>(asset: Asset) -> response::Result<'r> {
    get_asset(asset)
}

#[get("/<_file..>", rank = 99)]
pub fn assets<'r>(asset: Asset, _file: PathBuf) -> response::Result<'r> {
    get_asset(asset)
}

fn get_asset<'r>(asset: Asset) -> response::Result<'r> {
    let mut response = response::Response::build();
    response.sized_body(Cursor::new(asset.content));

    if asset.content_type.is_some() {
        response.header(asset.content_type.unwrap());
    }

    if asset.is_gzipped {
        response.header(rocket::http::Header::new("Content-Encoding", "gzip"));
    }

    response.ok()
}
