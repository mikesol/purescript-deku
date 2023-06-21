module Deku.DOM.Elt.Picture where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

picture
  :: Array (Event (Attribute Tags.Picture_))
  -> Array Nut
  -> Nut
picture = DC.elementify3 "picture"

picture_
  :: Array Nut
  -> Nut
picture_ = picture empty

picture__
  :: String
  -> Nut
picture__ t = picture_ [ DC.text_ t ]
