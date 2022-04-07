# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2022-04-07

### Added

Uses phantom type to prevent subscriptions to unlawful events.

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
