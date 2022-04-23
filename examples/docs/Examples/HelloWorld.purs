module Deku.Examples.Docs.Examples.HelloWorld where

import Prelude

import Deku.Control (text_)
import Deku.Toplevel (runInBody2)
import Effect (Effect)

main :: Effect Unit
main = runInBody2 (text_ "Hello world")