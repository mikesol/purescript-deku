module Deku.DOM.Elt.Sup where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Sup_

sup :: Array (FRP.Event.Event (Deku.Attribute.Attribute Sup_)) -> Array Nut -> Nut
sup = DC.elementify2 "sup"

sup_ :: Array Nut -> Nut
sup_ = sup empty

sup__ :: String -> Nut
sup__ t = sup_ [ DC.text_ t ]
