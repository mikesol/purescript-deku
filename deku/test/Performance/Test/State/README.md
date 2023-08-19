# Performance Test: State

This test measures Hooks overhead by comparing a component and a Hooks-based component which update state several hundred times in response to a click. This test isn't particularly useful on its own; if Hooks add a half millisecond per render + Hooks evaluation, then several hundred updates in a row will add significantly to its execution time. Of course, you would never ever do this in the real world.

It's still useful as a small sanity check when testing changes -- the Hooks version should not be much slower than the regular component version, though it may use more heap as it stores slightly more state.

## Mike's note

As Deku's monadic context is `Effect`, there's no instance of `modify`. I've used an approximation via `Ref`.
