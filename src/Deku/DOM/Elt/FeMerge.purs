module Deku.DOM.Elt.FeMerge where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data FeMerge_

feMerge
  :: Array (Attribute FeMerge_)
  -> Array Nut
  -> Nut
feMerge = DC.elementify2 "feMerge"

feMerge_
  :: Array Nut
  -> Nut
feMerge_ = feMerge empty

feMerge__
  :: String
  -> Nut
feMerge__ t = feMerge_ [ DC.text_ t ]
