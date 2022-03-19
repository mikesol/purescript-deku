# Adding dom units

When adding or modifying dom units in this library, there are several files you'll need to consult. This document attempts to keep the most recent up-to-date list of those files.

| file | action |
| ------- | ---- |
| `Deku.purs` | Top-level imports |
| `Deku/Change.purs` | Changing a unit's values, ie the frequency of an oscillator or the playback rate of a playbuf |
| `Deku/Create.purs` | Creating new dom units |
| `Deku/Cursor.purs` | Making a cursor that points to an dom unit |
| `Deku/Destroy.purs` | Destroying an dom unit
| `Deku/Graph/Constructors.purs` | Type-level representations of dom units |
| `Deku/Rebase.purs` | Reset the pointers in an dom graph |
| `Deku/Rendered.purs` | Low-level instructions for rendering an dom graph |
| `Deku/Universe/DOM.purs` | Constructors of dom units to be parsed by type classes |
| `Deku/Validation.purs` | Validation of the correctness of dom graphs |