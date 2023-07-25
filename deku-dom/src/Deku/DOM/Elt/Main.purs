module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Main_

main :: Array (FRP.Event.Event (Deku.Attribute.Attribute Main_)) -> Array Nut -> Nut
main = DC.elementify2 "main"

main_ :: Array Nut -> Nut
main_ = main empty

main__ :: String -> Nut
main__ t = main_ [ DC.text_ t ]
