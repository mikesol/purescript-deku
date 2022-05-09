module Deku.Example.Docs.Static.Build where

import Prelude

import Deku.Example.Docs.Scene (scene)
import Deku.Toplevel (Template(..), runSSR)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main =
  runSSR
    ( Template
        { head: "<html><head><title>Deku documentation</title><script defer src=\"bundle.js\"/></head>"
        , tail: "</html>"
        }
    )
    scene >>= log