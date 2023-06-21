module Deku.DOM.Elt.FeImage where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feImage
  :: Array (Event (Attribute Tags.FeImage_))
  -> Array Nut
  -> Nut
feImage = DC.elementify3 "feImage"

feImage_
  :: Array Nut
  -> Nut
feImage_ = feImage empty

feImage__
  :: String
  -> Nut
feImage__ t = feImage_ [ DC.text_ t ]
