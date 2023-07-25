module Deku.DOM.Elt.Header where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Header_

header :: Array (FRP.Event.Event (Deku.Attribute.Attribute Header_)) -> Array Nut -> Nut
header = DC.elementify2 "header"

header_ :: Array Nut -> Nut
header_ = header empty

header__ :: String -> Nut
header__ t = header_ [ DC.text_ t ]
