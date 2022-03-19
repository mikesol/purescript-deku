# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.4] - 2022-03-18

- Removes `SafeToFFI`, speeding up the rendering a bit.

## [0.7.3] - 2022-03-16

- Simplifies subgraph signature

## [0.7.2] - 2022-03-15

- Simplifies patched subgraph signature

## [0.7.1] - 2022-03-15

- Adds updating for single subgraph

## [0.7.0] - 2022-02-27

- Changes representation of dom parameters to better mirror the API.
- Fixes bugs in the `noLoop` version of `run`.
- Adds support for `setValueCurveAtTime`

## [0.6.9] - 2022-02-08

### Fixed

- Fixes clicks in certain scenarios where gain is 0.

## [0.6.8] - 2022-02-08

### Added

- Better MIDI out functionality (@TristanCacqueray).
- Allows media recorder to output blob.

## [0.6.7] - 2022-01-03

### Fixed

- Changes the definition of `isOn` to both `on` and `offOn`, smoothing out the switching on of buffers and oscillators.

## [0.6.6] - 2022-01-02

### Added

- Simplifies rendering algorithm in `Run.purs`.

## [0.6.5] - 2022-01-02

### Added

- Makes `control` parameter of looper more robust by turning it into a function. This allows initial controls to be informed by the environment in cases where the environment and control are otherwise decoupled.

## [0.6.4] - 2022-01-01

### Fixed

- Makes `run` start at 0.0 seconds all the time, allowing for smoother starts of works. Additional optimizations can be done, like graph pre-rendering for the 0 time frame (not sure if this is in fact an optimization, could even be slower, but theoretically it would optimize things), but this sounds good enough on first blush to leave it as-is for the time being.

## [0.6.3] - 2021-12-15

### Fixed

- Moves `Maybe'` to separate package.

## [0.6.2] - 2021-11-30

### Added

- A new `MediaElement` node for playing back from dom and video elements.

## [0.6.1] - 2021-11-22

### Added

- More instances for `Maybe'` like `Traversable`, `Foldable`, etc.

## [0.6.0] - 2021-11-22

### Added

- Uses rows and variants for most important types, reducing the need for pattern matching on instances. Duck typing is important when the environment changes, as tags on tagged unions do not transfer from environment to environment.

### Chore

- Treat FFIDOMSnapshot as a blob.

## [0.5.11] - 2021-11-16

### Added

- Looping scene now allows for the adding of a residual monoid.

## [0.5.10] - 2021-11-03

### Chore

- removes unused libs, codegen & tests

## [0.5.9] - 2021-11-01

### Added

- splits `decodeDOMBufferFromUri` into two separate functions and changes the signature from Promise to Aff.

### Fixed

- upgrades to `arraybuffer` 12.0.0 to avoid breaking polyfill.

## [0.5.8] - 2021-10-29

### Fixed

- returns correct value from filter in `Interpret.js`.

## [0.5.7] - 2021-10-27

### Added

- adds a hack that spews 0s to a context.

## [0.5.6] - 2021-10-27

### Fixed

- sets value instead of main for `gain`.

## [0.5.5] - 2021-10-20

### Added

- resume and state method for dom context.

## [0.5.4] - 2021-10-20

### Added

- better error logging when the decoding of dom files goes South.

## [0.5.3] - 2021-10-05

### Fixed

- nubs the input of tumultuous graphs so that one input can be used multiple times.

## [0.5.2] - 2021-10-05

### Fixed

- updates tumult when connection and tag holds constant but unit changes.

## [0.5.1] - 2021-10-05

### Added

- adds tumult command for dynamic subgraphs.

## [0.5.0] - 2021-10-02

### Added

- adds subgraph command.

### Fixed

- fixes `onOff` logic in generators, which would cause clipping in certain instances.

### Removed

- from template no longer exists and should be replaced with subgraph.

## [0.4.9] - 2021-10-01

### Fixed

- updates `purescript-event`

## [0.4.8] - 2021-09-23

### Fixed

- fixes `bufferToList`'s callback function, which had an erroneous unsubscribe.

## [0.4.8] - 2021-09-15

### Chore

- upgrades essential libraries.

## [0.4.7] - 2021-09-12

### Fixed

- `modifyRes` no longer requires dom interpret constraint.

## [0.4.6] - 2021-09-12

### Fixed

- All generators are now disconnected only after stopping, avoiding abrupt disconnects and pops.

## [0.4.5] - 2021-09-11

### Fixed

- Buffer offset is now changeable on PlayBuf instead of LoopBuf.

## [0.4.4] - 2021-09-09

### Added

- Graphs are now rows.

## [0.4.3] - 2021-09-09

### Added

- `Bind` and `Monad` instances for `IxWAG` where the graphs are equal.

## [0.4.2] - 2021-09-04

### Added

- `stop()` on generators is now sensitive to `DOMParamter` offset.
- all read-only properties of `BrowserDOMBuffer` are now accessible

## [0.4.1] - 2021-09-04

### Fixed

- Assets, environment and behaviors have been merged into just environment.

## [0.4.0] - 2021-09-01

### Added

- `DOMWorkletNode`
- `AnalyserNode`
- type-safe asset cache. **This is a breaking change**! `Scene`, `Frame`, `WAG` and `IxWAG` all take an `asset` type with the current asset cache and fail the build if it is not coherent with the asset being used (ie if a buffer or recorder is used that is not in the cache).

## [0.3.15] - 2021-08-25

### Fixed

- there were missing transitive dependencies that a newer version of `spago` failed the build for. These are now added to the relevant `.dhall` files.

## [0.3.14] - 2021-08-22

### Fixed

- the vector iterator in `fromTemplate` was backwards, leading to backwards-sounding music. This is now fixed!

## [0.3.13] - 2021-08-13

### Added

- hints of a graph can now include be derived from a tuple were the graph is in the functorial position.

## [0.3.12] - 2021-07-18

### Added

- outputs diagnostic info on rendering deadlines.
- passes headroom in seconds to `BehavingScene`.

## [0.3.11] - 2021-07-15

### Added

- `fromTemplate` now works on row types in addition to sized vectors.

## [0.3.10] - 2021-07-10

### Added

- unnamed units are now possible in create and change commands. When they exist, a name will be chosen by the compiler. The compiler tries to optimize for maximal reuse of dom units to avoid disjunction.

## [0.3.9] - 2021-07-08

### Added

- `startUsingWithHint` allows the quick bootstrapping of dom graphs at the beginning of a scene for instances where a fully-determined graph type is not present but a term or function producing that graph is.

## [0.3.8] - 2021-07-08

### Added

- `startUsing` allows the quick bootstrapping of dom graphs at the beginning of a scene.

## [0.3.7] - 2021-07-07

### Changed

- `BehavingScene` is now a newtype implementing `Newtype`. This allows it to be used in typeclass instance definitions.

## [0.3.6] - 2021-06-30

### Added

- Microphones, buffers, float arrays, wavetables and recorders are now behaviors instead of static objects. This means that it is possible to make and use new buffers mid-flight! Note that this is a _breaking change_, meaning that all microphones, buffers, float arrays, wavetables and recorders will need to become behaviors. This can be done by prepending existing ones with `pure`.
- The `active` field no longer exists on `BehavingScene`. Instead, the event is a `Maybe`, with `Nothing` representing an inactive state. This is also a _breaking change_.

## [0.3.5] - 2021-06-28

### Fixed

- Type-level `CreateT` now can handle `DOMParameter OnOff`.

## [0.3.4] - 2021-06-28

### Added

- Make `OnOff` an `DOMParameter`, which allows for more fine-grained starting and stopping in situations with loops.

## [0.3.3] - 2021-06-25

### Added

- `CreateT` and `ChangeT` types now allow one to do type-level operations on dom graphs without constructing terms on the JS level, saving up to a millisecond in rendering time depending on the size and complexity of the graphs being used.

## [0.3.2] - 2021-06-19

### Changed

- Typeclasses for `create` and `change` no longer use `hfoldlWithIndex`.

## [0.3.1] - 2021-06-09

### Added

- By popular demand, adds a looping piecewise function.
- Changes `sysTime` from `Instant` to `Milliseconds` for easier testing in repl.

## [0.3.0] - 2021-06-06

### Added

- Simplifies `change` instructions. Now, instead of writing `{ sinOsc: sinOsc_ 440.0 }` it is possible to write `{ sinOsc: 440.0 }`.
- Speeds up rendering by avoiding unnecessary checks.

### Changed

- The `Optional` files are now split between `Create` and `Change`. This fixes many bugs where a default parameter in a `Create` accidentally modulated a value during a `Change`. Now, the `Change` default is `Nothing`, meaning nothing changes. Furthermore, the underscore syntax (`sinOsc_`) has been removed.

## [0.2.4] - 2021-06-05

### Added

- DOM parameter now has functor, apply, applicative, bind, monad, semigroup and monoid instances.

## [0.2.3] - 2021-06-05

### Added

- Utility functions for working with dom parameters.
- Inlined periodic wave definitions.

## [0.2.2] - 2021-06-05

### Added

- Several functions for working with cofree comonads whose functor varies over time.
- Math functions for working with interpolation.

### Changed

- Eliminates `iwag` and `wag` functions in favor of `icont`.

## [0.2.1] - 2021-06-02

### Added

- An `icont` function for easier continuations using indexed monads.

## [0.2.0] - 2021-06-02

### Changed

- Eliminates custom `do` binding in favor of `Ix.do`.
- Simplifies several signatures and conventions.
- Eliminates reflection of `proof` on the term level.
- Reduces code base size by ~15%.

## [0.1.5] - 2021-05-30

### Added

- A new `forceSet` parameter allows for parameters to be set irrespective of what the previous value was. This eliminates clicks in some situations.

## [0.1.4] - 2021-05-23

### Added

- A new `patch` function allows for the automatic creation, connection, disconnection and destruction of dom units.

### Fixed

- Some bugs in `Interpret.js` caused dom generators to be initialized incorrectly in certain cases when resuming playback. These are fixed.

## [0.1.3] - 2021-05-21

### Added

- Uses `cancelScheduledValues` to cancel future values for an dom parameter.

## [0.1.2] - 2021-05-20

### Added

- New instances for dom parameter make doing math with them easier.

## [0.1.1] - 2021-05-20

### Added

- Makes validation of dom graphs optional in `makeScene`. As dom graphs are already validated as they are built, the extra validation step in `makeScene` mostly catches corner cases. By making validation optional in `makeScene`, projects with complex graphs compile ~100x faster and can opt into validation when needed.

### Changed

- DOM graphs no longer have additional validation by default. Validation is now opt-in.

## [0.1.0] - 2021-05-17

### Added

- Uses extensible records to represent dom graphs.
- Simplifies many function signatures.

### Fixed

- Setting the time of a delay would cause an error due to a misspelled property name. This is now fixed.

## [0.0.4] - 2021-04-29

### Added

- Returns an object from `change`, `changeAt`, `changes` and `change'` that reflects the changed dom unit. Previously, these functions had returned `Unit` (akin to `set` in many libraries), whereas now they return an updated value (akin to `modify`).
- Adds an `asGetter` function to transform any graph into a getter. On `change`, this will get the previous values instead of modifying them.
- Adds a `get` family of functions, `get`, `getAt`, `gets` and `get'` that work exactly like their analogue from the `change` family of functions but act as getters by using `asGetter` internally. Importantly, the `get` family of functions does _not_ increment the change bit.

## [0.0.3] - 2021-04-28

### Added

- Uses strings instead of symbols for setting buffered content. This is a _breaking change_ that moves buffers conceptually closer to other generators. For example, in a sine-wave oscillator, a frequency that changes over time determines what one hears. In a buffer, the buffered dom can be thought of in the same way: it can change over time. That said, changing buffers mid-flight leads to glitchy sound, so the change only takes effect once the buffer is _off_.
- Uses strings instead of symbols for setting the real and imaginary parts of periodic oscillators (see above).

## [0.0.2] - 2021-04-22

### Added

- Pulls in correct bower.json packages for compatibility with projects that do not use spago.

## [0.0.1] - 2021-04-22

### Added

- Adds a bower.json file for publishing to Pursuit.

## [0.0.0] - 2021-04-22

### Added

- Exposes the WebDOM API via a FRP Behavior by using induction on existentially-quantified and linearly-typed indexed cofree comonads.
- A README.
- A CHANGELOG.
- Several tests.
- Several examples.
