module Deku.DOM.Elt.FeMorphology where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeMorphology_

feMorphology
  :: Event (Attribute FeMorphology_)
  -> Array Domable
  -> Domable
feMorphology = DC.elementify2 "feMorphology"

feMorphology_
  :: Array Domable
  -> Domable
feMorphology_ = feMorphology empty

feMorphology__
  :: String
  -> Domable
feMorphology__ t = feMorphology_ [ DC.text_ t ]
