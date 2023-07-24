module Deku.DOM.Elt.Rtc where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Rtc_

rtc :: Array (FRP.Event.Event (Deku.Attribute.Attribute Rtc_)) -> Array Nut -> Nut
rtc = DC.elementify2 "rtc"

rtc_ :: Array Nut -> Nut
rtc_ = rtc empty

rtc__ :: String -> Nut
rtc__ t = rtc_ [ DC.text_ t ]
