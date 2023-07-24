module Deku.DOM.Elt.FilterPrimitive where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FilterPrimitive_

filterPrimitive
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute FilterPrimitive_)) -> Array Nut -> Nut
filterPrimitive = DC.elementify2 "filter-primitive"

filterPrimitive_ :: Array Nut -> Nut
filterPrimitive_ = filterPrimitive empty

filterPrimitive__ :: String -> Nut
filterPrimitive__ t = filterPrimitive_ [ DC.text_ t ]
