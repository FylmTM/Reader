pub type Pool = r2d2::Pool<r2d2_sqlite::SqliteConnectionManager>;

pub trait AcquireConnection {
    fn conn(
        &self,
    ) -> Result<r2d2::PooledConnection<r2d2_sqlite::SqliteConnectionManager>, r2d2::Error>;
}

impl AcquireConnection for Pool {
    fn conn(
        &self,
    ) -> Result<r2d2::PooledConnection<r2d2_sqlite::SqliteConnectionManager>, r2d2::Error> {
        self.clone().get()
    }
}
