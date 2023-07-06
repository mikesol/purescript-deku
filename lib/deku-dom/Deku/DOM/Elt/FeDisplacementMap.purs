module Deku.DOM.Elt.FeDisplacementMap where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data FeDisplacementMap_

feDisplacementMap
  :: Array (Event (Attribute FeDisplacementMap_))
  -> Array Nut
  -> Nut
feDisplacementMap = DC.elementify2 "feDisplacementMap"

feDisplacementMap_
  :: Array Nut
  -> Nut
feDisplacementMap_ = feDisplacementMap empty

feDisplacementMap__
  :: String
  -> Nut
feDisplacementMap__ t = feDisplacementMap_ [ DC.text_ t ]
