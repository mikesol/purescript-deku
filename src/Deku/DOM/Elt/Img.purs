module Deku.DOM.Elt.Img where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Img_

img
  :: Event (Attribute Img_)
  -> Array Domable
  -> Domable
img = DC.elementify2 "img"

img_
  :: Array Domable
  -> Domable
img_ = img empty

img__
  :: String
  -> Domable
img__ t = img_ [ DC.text_ t ]
