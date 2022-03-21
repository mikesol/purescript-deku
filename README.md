# purescript-deku

![deku](./deku.gif)

A PureScript web micro-framework.

## Why?

Deku aims to be:

- **fast**: it's up to 2x faster than Halogen for a simple Todo MVC app.
- **small**: the average Deku program tends to be less lines of code than its React or Halogen counterparts.
- **ssr-friendly**: Deku has out-of-the-box server-side rendering capabilities.

Deku started as an experiment taking [`purescript-wags`](https://github.com/mikesol/purescritp-wags) and replacing all the Web Audio stuff with DOM stuff. It turns out that the DOM and Web Audio are more alike than different, so the first draft took only a few hours. It uses the same file structure, naming conventions and core concepts as wags, making it ideal for performance-critical apps.

## Benchmarks

Here are some recent benchmarks from the test suite comparing Deku to Halogen and Halogen Hooks. The test suite is the same one that is used in [`halogen-hooks`](https://github.com/thomashoneyman/purescript-halogen-hooks).

### The State test

Many effectful computations followed by a DOM modification.

```json
{
  "hookAverage": {
    "totalTime": "171ms",
    "scriptTime": "121ms",
    "peakHeap": "2570kb",
    "averageHeap": "1062kb",
    "averageFPS": 15
  },
  "dekuAverage": {
    "totalTime": "73ms",
    "scriptTime": "18ms",
    "peakHeap": "842kb",
    "averageHeap": "378kb",
    "averageFPS": 215
  },
  "componentAverage": {
    "totalTime": "106ms",
    "scriptTime": "56ms",
    "peakHeap": "1288kb",
    "averageHeap": "613kb",
    "averageFPS": 35
  }
}
```

### The Todo test

A vanilla MVC Todo app.

```json
{
  "hookAverage": {
    "totalTime": "567ms",
    "scriptTime": "397ms",
    "peakHeap": "13292kb",
    "averageHeap": "6242kb",
    "averageFPS": 18
  },
  "dekuAverage": {
    "totalTime": "230ms",
    "scriptTime": "67ms",
    "peakHeap": "1768kb",
    "averageHeap": "1136kb",
    "averageFPS": 36
  },
  "componentAverage": {
    "totalTime": "401ms",
    "scriptTime": "206ms",
    "peakHeap": "6835kb",
    "averageHeap": "3844kb",
    "averageFPS": 26
  }
}
```

## Examples

Here are some [examples](./examples) to get you started.

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