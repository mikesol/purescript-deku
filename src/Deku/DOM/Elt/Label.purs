module Deku.DOM.Elt.Label where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Label_

label
  :: Event (Attribute Label_)
  -> Array Domable
  -> Domable
label = DC.elementify2 "label"

label_
  :: Array Domable
  -> Domable
label_ = label empty

label__
  :: String
  -> Domable
label__ t = label_ [ DC.text_ t ]
