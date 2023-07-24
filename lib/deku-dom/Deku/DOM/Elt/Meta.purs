module Deku.DOM.Elt.Meta where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Meta_

meta :: Array (FRP.Event.Event (Deku.Attribute.Attribute Meta_)) -> Array Nut -> Nut
meta = DC.elementify2 "meta"

meta_ :: Array Nut -> Nut
meta_ = meta empty

meta__ :: String -> Nut
meta__ t = meta_ [ DC.text_ t ]
