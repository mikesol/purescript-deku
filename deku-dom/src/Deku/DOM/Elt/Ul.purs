module Deku.DOM.Elt.Ul where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Ul_

ul :: Array (FRP.Event.Event (Deku.Attribute.Attribute Ul_)) -> Array Nut -> Nut
ul = DC.elementify2 "ul"

ul_ :: Array Nut -> Nut
ul_ = ul empty

ul__ :: String -> Nut
ul__ t = ul_ [ DC.text_ t ]
