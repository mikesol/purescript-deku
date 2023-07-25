module Deku.DOM.Elt.Tt where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Tt_

tt :: Array (FRP.Event.Event (Deku.Attribute.Attribute Tt_)) -> Array Nut -> Nut
tt = DC.elementify2 "tt"

tt_ :: Array Nut -> Nut
tt_ = tt empty

tt__ :: String -> Nut
tt__ t = tt_ [ DC.text_ t ]
