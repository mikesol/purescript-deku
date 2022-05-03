# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.7] - 2022-05-05

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

- Updates event and behavior libraries.

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

- Exposes the DOM API via a FRP Behavior by using induction on existentially-quantified and linearly-typed indexed cofree comonads that act as kan-extended natural transformations over embedded universal morphisms.
- A README.
- A CHANGELOG.
- Several tests.
- Several examples.
- Documentation.
