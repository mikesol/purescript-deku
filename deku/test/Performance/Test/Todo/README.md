# Performance Test: Todo

This test measures performance when nesting components several layers deep and updating from the root. It's intended to catch performance issues that would be relevant in the real world.

Actions:

- Add a new TODO
- Check and un-check a TODO
- Edit a TODO and save it

## Mike's note

Because of the way Deku `subgraph`-s work, a lot of the data-passing in the Halogen examples isn't necessary. I cut it out, which makes the example's design slightly different. That said, it does the same thing the others do.