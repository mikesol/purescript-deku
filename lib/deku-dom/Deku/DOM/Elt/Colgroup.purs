module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Colgroup_

colgroup :: Array (FRP.Event.Event (Deku.Attribute.Attribute Colgroup_)) -> Array Nut -> Nut
colgroup = DC.elementify2 "colgroup"

colgroup_ :: Array Nut -> Nut
colgroup_ = colgroup empty

colgroup__ :: String -> Nut
colgroup__ t = colgroup_ [ DC.text_ t ]
