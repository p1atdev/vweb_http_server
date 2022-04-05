module main

import vweb

fn main() {
	vweb.run(&App{}, 8080)
}

struct App {
	vweb.Context
}

// http://localhost:8080
fn (mut app App) index() vweb.Result {
	return app.html('<h1>Index</h1>')
}

// http://localhost:8080/hello
['/hello']
fn (mut app App) world() vweb.Result {
	return app.text('Hello, World!')
}

// http://localhost:8080/hello/world
['/hello/:user']
fn (mut app App) hello_user(user string) vweb.Result {
	return app.text('Hello, $user!')
}

// POST http://localhost:8080/post_request
[post]
fn (mut app App) post_request() vweb.Result {
	return app.text('POST request!')
}

// POST http://localhost:8080/post/name
['/post/:name'; post]
fn (mut app App) post_with_name(name string) vweb.Result {
	return app.text('POST, $name!')
}
