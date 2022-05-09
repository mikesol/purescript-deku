module Deku.Example.Docs.Static.Live where

import Prelude

import Deku.Example.Docs.Scene (scene)
import Deku.Toplevel (hydrate)
import Effect (Effect)

main :: Effect Unit
main = hydrate scene