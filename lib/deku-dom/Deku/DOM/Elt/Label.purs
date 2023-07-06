module Deku.DOM.Elt.Label where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Label_

label
  :: Array (Event (Attribute Label_))
  -> Array Nut
  -> Nut
label = DC.elementify2 "label"

label_
  :: Array Nut
  -> Nut
label_ = label empty

label__
  :: String
  -> Nut
label__ t = label_ [ DC.text_ t ]
