use crate::error::Error as E;
use rocket::http::{ContentType, Status};
use rocket::request::FromRequest;
use rocket::response;
use rocket::{Outcome, Request};
use std::borrow::Cow;
use std::ffi::OsStr;
use std::io::Cursor;
use std::path::{Path, PathBuf};

#[derive(RustEmbed)]
#[folder = "static"]
struct Assets;

pub struct Asset {
    path: String,
    content: Cow<'static, [u8]>,
}

impl<'a, 'r> FromRequest<'a, 'r> for Asset {
    type Error = E;

    fn from_request(request: &'a Request<'r>) -> rocket::request::Outcome<Self, E> {
        let path_raw = request.uri().path();
        let path = if path_raw == "/" {
            "index.html".to_string()
        } else {
            // Assets path are relative. We need to remove first '/' from url path.
            path_raw[1..].to_string()
        };

        let file: Option<Cow<'static, [u8]>> = Assets::get(&path);
        debug!(
            "Trying to serve asset path={} exists={}",
            path,
            file.is_some()
        );
        file.map_or_else(
            || Outcome::Forward(()),
            |content| {
                debug!("Serve asset path={}", path);
                Outcome::Success(Asset { path, content })
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
    let path = Path::new(&asset.path);

    let extension = path
        .extension()
        .and_then(OsStr::to_str)
        .ok_or(Status::new(400, "Could not get file extension"))?;
    let content_type: ContentType = ContentType::from_extension(extension)
        .ok_or(Status::new(400, "Could not get file content type"))?;

    response::Response::build()
        .header(content_type)
        .sized_body(Cursor::new(asset.content))
        .ok()
}
