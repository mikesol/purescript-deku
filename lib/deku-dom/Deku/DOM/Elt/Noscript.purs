module Deku.DOM.Elt.Noscript where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Noscript_

noscript :: Array (FRP.Event.Event (Deku.Attribute.Attribute Noscript_)) -> Array Nut -> Nut
noscript = DC.elementify2 "noscript"

noscript_ :: Array Nut -> Nut
noscript_ = noscript empty

noscript__ :: String -> Nut
noscript__ t = noscript_ [ DC.text_ t ]
