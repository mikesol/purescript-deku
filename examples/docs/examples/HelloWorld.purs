module Deku.Examples.Docs.Examples.HelloWorld where

import Prelude

import Deku.Control (text_)
import Deku.Toplevel ((🚀))
import Effect (Effect)

main :: Effect Unit
main = unit 🚀 \_ _ -> text_ "Hello world"