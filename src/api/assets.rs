use std::borrow::Cow;
use std::ffi::OsStr;
use std::io::Cursor;
use std::path::{Path, PathBuf};

use rocket::http::ContentType;
use rocket::request::FromRequest;
use rocket::response;
use rocket::{Outcome, Request};

use crate::error::Error as E;

#[derive(RustEmbed)]
#[folder = "static"]
struct Assets;

const INDEX: &str = "index.html";

pub struct Asset {
    content: Cow<'static, [u8]>,
    content_type: Option<ContentType>,
}

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

        let file: Option<Cow<'static, [u8]>> = Assets::get(&path);
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
    match asset.content_type {
        Some(content_type) => response::Response::build()
            .header(content_type)
            .sized_body(Cursor::new(asset.content))
            .ok(),
        None => response::Response::build()
            .sized_body(Cursor::new(asset.content))
            .ok(),
    }
}
