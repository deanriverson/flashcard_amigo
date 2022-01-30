This sample is from the Serving Pages to the Web section of Chapter 2.
It uses the _actix_ web framework and the _serde_ serialization libraries.

This was an experiment in writing a web app in Rust.  **It failed.**  Even with
this very simple app, each little one-line change takes over 30 seconds to
recompile.  This is way to slow for quick web app development.