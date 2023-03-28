module Deku.DOM.Elt.Image where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Image_

image
  :: Event (Attribute Image_)
  -> Array Domable
  -> Domable
image = DC.elementify2 "image"

image_
  :: Array Domable
  -> Domable
image_ = image empty

image__
  :: String
  -> Domable
image__ t = image_ [ DC.text_ t ]
