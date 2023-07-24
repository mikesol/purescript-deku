module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Audio_

audio :: Array (FRP.Event.Event (Deku.Attribute.Attribute Audio_)) -> Array Nut -> Nut
audio = DC.elementify2 "audio"

audio_ :: Array Nut -> Nut
audio_ = audio empty

audio__ :: String -> Nut
audio__ t = audio_ [ DC.text_ t ]
