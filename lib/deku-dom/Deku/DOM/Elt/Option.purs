module Deku.DOM.Elt.Option where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Option_

option :: Array (FRP.Event.Event (Deku.Attribute.Attribute Option_)) -> Array Nut -> Nut
option = DC.elementify2 "option"

option_ :: Array Nut -> Nut
option_ = option empty

option__ :: String -> Nut
option__ t = option_ [ DC.text_ t ]
