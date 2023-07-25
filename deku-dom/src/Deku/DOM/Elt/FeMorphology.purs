module Deku.DOM.Elt.FeMorphology where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeMorphology_

feMorphology
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeMorphology_)) -> Array Nut -> Nut
feMorphology = DC.elementify2 "feMorphology"

feMorphology_ :: Array Nut -> Nut
feMorphology_ = feMorphology empty

feMorphology__ :: String -> Nut
feMorphology__ t = feMorphology_ [ DC.text_ t ]
