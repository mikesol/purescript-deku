module Deku.DOM.Elt.Mark where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Mark_

mark
  :: Array (Attribute Mark_)
  -> Array Nut
  -> Nut
mark = DC.elementify2 "mark"

mark_
  :: Array Nut
  -> Nut
mark_ = mark empty

mark__
  :: String
  -> Nut
mark__ t = mark_ [ DC.text t ]
