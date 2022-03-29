module Deku.Example.Docs.Example.HelloWorld where

import Prelude

import Deku.Control.Functions (freeze, u)
import Deku.Graph.DOM.Shorthand as S
import Deku.Toplevel ((🚀))
import Effect (Effect)

main :: Effect Unit
main = (const $ u $ S.text "Hello world") 🚀 freeze
