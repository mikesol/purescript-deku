module Deku.DOM.Elt.Hr where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Hr_

hr :: Array (FRP.Event.Event (Deku.Attribute.Attribute Hr_)) -> Array Nut -> Nut
hr = DC.elementify2 "hr"

hr_ :: Array Nut -> Nut
hr_ = hr empty

hr__ :: String -> Nut
hr__ t = hr_ [ DC.text_ t ]
