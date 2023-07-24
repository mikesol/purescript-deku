module Deku.DOM.Elt.Filter where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Filter_

filter :: Array (FRP.Event.Event (Deku.Attribute.Attribute Filter_)) -> Array Nut -> Nut
filter = DC.elementify2 "filter"

filter_ :: Array Nut -> Nut
filter_ = filter empty

filter__ :: String -> Nut
filter__ t = filter_ [ DC.text_ t ]
