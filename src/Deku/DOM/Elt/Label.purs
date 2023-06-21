module Deku.DOM.Elt.Label where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

label
  :: Array (Event (Attribute Tags.Label_))
  -> Array Nut
  -> Nut
label = DC.elementify3 "label"

label_
  :: Array Nut
  -> Nut
label_ = label empty

label__
  :: String
  -> Nut
label__ t = label_ [ DC.text_ t ]
