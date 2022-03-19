# purescript-deku

![deku](./deku.gif)

DOMs Emitted as Kan-extended Universals.

## Why?

It's fast and type-safe.

## Main idea

This library is comprised of two parts.

1. An API for creating streams of DOMs.
1. An API for rendering the streams in the browser.

# Examples

There are some other examples to get you started:

- **Hello world** ([code](./examples/hello-world) | [sound](https://purescript-deku-hello-world.surge.sh/))


## Bundling on your site

To see how to bundle this library on your site, please visit the [examples](./examples) directory.

To compile the JS for the hello world example, issue the following command:

```bash
npx spago -x examples.dhall bundle-app \
  --main Deku.Example.HelloWorld \
  --to examples/hello-world/index.js
```

Other examples will work the same way, with the directory and module name changing. Then, to access the example, you can run a http server from the directory and navigate to the url, ie `cd examples/hello-world && python -m http.server` and then navigate to localhost:8000.
