module Deku.DOM.Elt.FeMorphology where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feMorphology
  :: Array (Event (Attribute Tags.FeMorphology_))
  -> Array Nut
  -> Nut
feMorphology = DC.elementify3 "feMorphology"

feMorphology_
  :: Array Nut
  -> Nut
feMorphology_ = feMorphology empty

feMorphology__
  :: String
  -> Nut
feMorphology__ t = feMorphology_ [ DC.text_ t ]
