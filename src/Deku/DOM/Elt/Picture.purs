module Deku.DOM.Elt.Picture where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Picture_

picture
  :: Event (Attribute Picture_)
  -> Array Domable
  -> Domable
picture = DC.elementify2 "picture"

picture_
  :: Array Domable
  -> Domable
picture_ = picture empty

picture__
  :: String
  -> Domable
picture__ t = picture_ [ DC.text_ t ]
