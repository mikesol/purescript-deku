module Deku.DOM.Elt.Samp where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Samp_

samp :: Array (FRP.Event.Event (Deku.Attribute.Attribute Samp_)) -> Array Nut -> Nut
samp = DC.elementify2 "samp"

samp_ :: Array Nut -> Nut
samp_ = samp empty

samp__ :: String -> Nut
samp__ t = samp_ [ DC.text_ t ]
