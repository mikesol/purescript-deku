module Deku.DOM.Elt.Keygen where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Keygen_

keygen :: Array (FRP.Event.Event (Deku.Attribute.Attribute Keygen_)) -> Array Nut -> Nut
keygen = DC.elementify2 "keygen"

keygen_ :: Array Nut -> Nut
keygen_ = keygen empty

keygen__ :: String -> Nut
keygen__ t = keygen_ [ DC.text_ t ]
