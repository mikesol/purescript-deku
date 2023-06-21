module Deku.DOM.Elt.Image where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

image
  :: Array (Event (Attribute Tags.Image_))
  -> Array Nut
  -> Nut
image = DC.elementify3 "image"

image_
  :: Array Nut
  -> Nut
image_ = image empty

image__
  :: String
  -> Nut
image__ t = image_ [ DC.text_ t ]
