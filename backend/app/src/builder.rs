use anyhow;
use axum::Router;

use api_server::api;
use app_context::AppContext;

pub fn build_app() -> anyhow::Result<Router> {
    // build context
    // let user_repository = UserRepositoryImpl::new(pool);

    // dependency injection
    let context = AppContext { user_repository };

    Ok(api(context))
}
