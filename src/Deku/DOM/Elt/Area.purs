module Deku.DOM.Elt.Area where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Area_

area
  :: Event (Attribute Area_)
  -> Array Domable
  -> Domable
area = DC.elementify2 "area"

area_
  :: Array Domable
  -> Domable
area_ = area empty

area__
  :: String
  -> Domable
area__ t = area_ [ DC.text_ t ]
