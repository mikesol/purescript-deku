npx spago -x examples.dhall bundle-app --main Deku.Example.SSRSSR --to examples/ssr/make.js
node ./examples/ssr/make.js $> ./examples/ssr/index.html
npx spago -x examples.dhall bundle-module --main Deku.Example.SSRMain --to examples/ssr/index.js