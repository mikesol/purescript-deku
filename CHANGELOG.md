# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.9.13] - 2023-02-208

- Uses `merge` instead of `oneOf`.
- Adds `toDeku`.
- Adds `useRef`.

## [0.9.9 - 0.9.12] - 2023-02-15

- Version bumps to get documentation generated.

## [0.9.8] - 2022-12-07

- Cleaner SSR primitives.


## [0.9.7] - 2022-12-07

- Makes `runST` polymorphic over `r`.


## [0.9.6] - 2022-12-01

- Adds `NutWith`.
- Changes signature of `useMemoized`.
- Splits `onMount` into `onWillMount` and `onDidMount`.

## [0.9.5] - 2022-11-28

- Adds `guard`.
- Adds `useHot'`.

## [0.9.4] - 2022-11-28

- Adds inflix aliases for `switcher` and `switcherFlipped`.
- Exports new DOM constructors for easier access.

## [0.9.3] - 2022-11-27

- Adds one-off version of most listeners.

## [0.9.2] - 2022-11-27

- Adds `CSS.render` for interop with `purescript-css`.

## [0.9.1] - 2022-11-27

- Adds double-underscore methods.

## [0.9.0] - 2022-11-27

- Adds lifecycle methods `onMount`, `onDismount`, and `bracket`.

## [0.8.7] - 2022-11-20

- Adds `useHot`.

## [0.8.6] - 2022-11-06

- Adds svg.

## [0.8.5] - 2022-11-04

- Removes spurious applicative constraints.

## [0.8.4] - 2022-11-03

- Adds `unsafeCustomElement` for unsafe custom elements.

## [0.8.3] - 2022-11-02

- Removes `nut` from PursX.

## [0.8.2] - 2022-10-31

- Adds `useDyn` hooks.

## [0.8.1] - 2022-10-30

- Uses optimized lemming functions from `hyrule` when appropriate.

## [0.8.0] - 2022-09-22

- `Nut` is a monoid!

## [0.7.0] - 2022-09-10

- Simplifies signatures

## [0.6.0] - 2022-08-22

- Uses the Zora monad.

## [0.5.0] - 2022-08-15

- Makes the API more composition-friendly.


## [0.4.13] - 2022-06-20

- Removes spurious warning.

## [0.4.12] - 2022-06-16

- Fixes SSR bug.

## [0.4.10] - 2022-06-15

- Uses comments for better SSR.

## [0.4.9] - 2022-06-11

- Uses better string replacement in SSR

## [0.4.8] - 2022-06-06

- Updates to new bolson

## [0.4.7] - 2022-06-05

- Adds newtype for Nut.

## [0.4.6] - 2022-06-01

- Updates to new Bolson.

## [0.4.5] - 2022-05-26

- Better SSR support and attribute rendering.

## [0.4.4] - 2022-05-20

- Less spurious warnings.

## [0.4.3] - 2022-05-19

- Cleaner type synonyms.


## [0.4.2] - 2022-05-16

- Updates Bolson.

## [0.4.1] - 2022-05-12

- Uses Bolson for core logic.

## [0.4.0] - 2022-05-10

- Adds server-side rendering, or SSaRrrrr, as the pirates would say.

## [0.3.8] - 2022-05-04

- Adds helper functions for `click` and `slider`.

## [0.3.7] - 2022-05-03

- Allows accessing of elements via `self`.

## [0.3.6] - 2022-04-30

- Updates to `0.15.0`.

## [0.3.5] - 2022-04-23

- More instances for attribute creation.

## [0.3.4] - 2022-04-23

- More efficient cache pruning.

## [0.3.3] - 2022-04-23

- Improves portal implementation.

## [0.3.2] - 2022-04-23

- Fixes portal bug.

## [0.3.1] - 2022-04-23

- Internal optimizations for faster event rendering.

## [0.3.0] - 2022-04-23

- Gets rid of subgraphs and greatly simplifies code base.

## [0.2.6] - 2022-04-18

- Adds hack for working with a 2D canvas.

## [0.2.5] - 2022-04-17

- Splits files for faster compilation.

## [0.2.4] - 2022-04-14

- Fixes recursive pursx bug.

## [0.2.3] - 2022-04-14

- Gets rid of subgraph env, opting to use index for initialization.

## [0.2.2] - 2022-04-11

- Updates event and poll libraries.

## [0.2.1] - 2022-04-08

- Reverts experiment

## [0.2.0] - 2022-04-07

- A failed experiment in creating phantom types around events. Conceptually, this makes no sense. An event should only be gated with a phantom type if it is somehow tightly coupled to the context in which it is executing. Otherwise, each subscription is separate, so there can be as many as you like. If subscriptions cause some sort of saturation, then you'll want to limit the number of events (for example by creating a hot `requestAnimationFrame` at the toplevel rather than several cold ones).

## [0.1.3] - 2022-04-07

### Removed

- Spurious parammeter in the `SubgraphF` type.

## [0.1.2] - 2022-04-06

### Added

- Uses existential types for subgraph construction, which makes it easier to have subgraphs with different pushers.

## [0.1.1] - 2022-04-05

### Chore

- Fix `Left` bug in interpret

## [0.1.0] - 2022-03-30

### Breaking change alert!

Changes to a different model that uses less typelevel programming and a more SDOM-y approach, while using similar fine-grained state management to Wags. Read the docs to find out more!

## [0.0.8] - 2022-03-25

### Bugfix

Interprets `checked` correctly.


## [0.0.7] - 2022-03-25

### Bugfix

Adds a closure term to subgraph calculations.

## [0.0.6] - 2022-03-25

### Bugfix

Fixes the sorting algorithm on insert of subgraphs.

## [0.0.5] - 2022-03-25

- This exists due to a botched git-push before :-/

## [0.0.4] - 2022-03-25

### Added

- New `@@>` and `%%>` functions for scenes that do not respond to their environment.
- Fixed bug when `psx` is at top-level.

## [0.0.3] - 2022-03-25

### Added

- Adds whitespace to allowable attribute values.

## [0.0.2] - 2022-03-25

### Added

- Comment parsing to the pursx parser.

## [0.0.1] - 2022-03-24

### Added

- A PursX parser.

## [0.0.0] - 2022-03-23

### Added

- Exposes the DOM API via a FRP Poll by using induction on existentially-quantified and linearly-typed indexed cofree comonads that act as kan-extended natural transformations over embedded universal morphisms.
- A README.
- A CHANGELOG.
- Several tests.
- Several examples.
- Documentation.
