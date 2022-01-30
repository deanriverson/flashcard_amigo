use actix_web::{middleware, web, App, HttpResponse, HttpServer};
use serde::Deserialize;

#[derive(Deserialize)]
struct Word {
    en: String,
    es: String,
    pos: String,
    cats: String,
    tags: String,
}

fn main() {
    env_logger::init();

    let server = HttpServer::new(|| {
        App::new()
            .wrap(middleware::Logger::default())
            .route("/", web::get().to(get_index))
            .route("/gcd", web::post().to(post_gcd))
    });

    println!("Serving on http://loclahost:3000...");
    server
        .bind("127.0.0.1:3000")
        .expect("error binding server port 3000")
        .run()
        .expect("error running server");
}

fn get_index() -> HttpResponse {
    HttpResponse::Ok().content_type("text/html").body(
        r#"
        <title>GCD Calculator</title>
        <form action="/gcd" method="post">
            <input type="text" name="en"/>
            <input type="text" name="es"/>
            <input type="text" name="pos"/>
            <input type="hidden" name="cats" value="one, two">
            <input type="hidden" name="tags" value="three, four">
            <button type="submit">Save</button>
        </form>
        "#,
    )
}

fn post_gcd(form: web::Form<Word>) -> HttpResponse {
    // if form.n == 0 || form.m == 0 {
    //     return HttpResponse::BadRequest()
    //         .content_type("text/html")
    //         .body("Computing the GCD with zero is boring.");
    // }

    let response = format!(
        "You posted {} => {}, which is a {}. cats={:?}, tags={:?}",
        form.en, form.es, form.pos, form.cats, form.tags
    );

    HttpResponse::Ok().content_type("text/html").body(response)
}
