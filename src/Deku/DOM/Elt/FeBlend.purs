module Deku.DOM.Elt.FeBlend where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeBlend_

feBlend
  :: Event (Attribute FeBlend_)
  -> Array Domable
  -> Domable
feBlend = DC.elementify2 "feBlend"

feBlend_
  :: Array Domable
  -> Domable
feBlend_ = feBlend empty

feBlend__
  :: String
  -> Domable
feBlend__ t = feBlend_ [ DC.text_ t ]
