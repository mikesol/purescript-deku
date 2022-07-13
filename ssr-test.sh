npx spago -x examples.dhall bundle-app --main Deku.Example.SSRSSR --to examples/ssr/make.js
node ./examples/ssr/make.js $> ./examples/ssr/index.html
npx spago -x examples.dhall bundle-module --main Deku.Example.SSRHydrate --to examples/ssr/index.js
npx spago -x examples.dhall bundle-module --main Deku.Example.SSRMain --to examples/ssr/bundle.js