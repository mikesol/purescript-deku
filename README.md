# purescript-deku

![deku](./deku.gif)

A PureScript web micro-framework for apps that need to be fast.

## In anger

- [Verity Scheel's post on parsing](https://cofree.coffee/~verity/parser.html) implements a full-featured tweening engine to animate rule-based parsing steps.
- [joyride.fm](https://joyride.fm) is a social rhythm game.
- [Horizontal and Vertical Events](https://dev.to/mikesol/horizontal-and-vertical-events-1pm1) is an article that explores some concepts central to Deku with many tryable & editable examples.


## Documentation

[Here is a guide](https://mikesol.github.io/purescript-deku/) to building apps with Deku. The guide is written in Deku and its source code can be found [here](./examples/docs/).

If you want to see a full-featured, highly-optimized Deku site with lots of event handlers, race conditions, asynchronous logic, etc, check out the [wags documentation](https://mikesol.github.io/purescript-wags).

## Why another web framework?

Deku aims to be:

- **fast**: it's up to 2x faster than Halogen for a simple Todo MVC app.
- **small**: the average Deku program tends to be less lines of code than its React or Halogen counterparts.
- **ssr-friendly**: Deku has out-of-the-box server-side rendering capabilities.

Deku started as an experiment taking [`purescript-wags`](https://github.com/mikesol/purescript-wags) and replacing all the Web Audio stuff with DOM stuff. It turns out that the DOM and Web Audio are more alike than different, so the first draft took only a few hours. It uses the same file structure, naming conventions and core concepts as wags, making it ideal for performance-critical apps.

## Examples

Here are some [examples](./examples) to get you started.

## SSR

If you are doing SSR with Deku, you _must install_ `jsdom`, ie `npm install --save-dev jsdom`. Currently, SSR is only supported in the Node environment.

## Bundling on your site

To see how to bundle this library on your site, please visit the [examples](./examples) directory.

To compile the JS for the hello world example, issue the following command:

```bash
npx spago -x examples.dhall bundle-app \
  --main Deku.Example.HelloWorld \
  --to examples/hello-world/index.js
```

Other examples will work the same way, with the directory and module name changing. Then, to access the example, you can run a http server from the directory and navigate to the url, ie `cd examples/hello-world && python -m http.server` and then navigate to localhost:8000.

## What does Deku mean?

Deku is short for "DOMs Emitted as Kan-extended Universals." It is also the tree of Zelda lore and is a Japanese diminutive for a dullard or simpleton.
