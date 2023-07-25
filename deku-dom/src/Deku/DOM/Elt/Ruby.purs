module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Ruby_

ruby :: Array (FRP.Event.Event (Deku.Attribute.Attribute Ruby_)) -> Array Nut -> Nut
ruby = DC.elementify2 "ruby"

ruby_ :: Array Nut -> Nut
ruby_ = ruby empty

ruby__ :: String -> Nut
ruby__ t = ruby_ [ DC.text_ t ]
