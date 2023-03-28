module Deku.DOM.Elt.FeDisplacementMap where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeDisplacementMap_

feDisplacementMap
  :: Event (Attribute FeDisplacementMap_)
  -> Array Domable
  -> Domable
feDisplacementMap = DC.elementify2 "feDisplacementMap"

feDisplacementMap_
  :: Array Domable
  -> Domable
feDisplacementMap_ = feDisplacementMap empty

feDisplacementMap__
  :: String
  -> Domable
feDisplacementMap__ t = feDisplacementMap_ [ DC.text_ t ]
