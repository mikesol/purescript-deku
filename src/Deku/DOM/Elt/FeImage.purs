module Deku.DOM.Elt.FeImage where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeImage_

feImage
  :: Event (Attribute FeImage_)
  -> Array Domable
  -> Domable
feImage = DC.elementify2 "feImage"

feImage_
  :: Array Domable
  -> Domable
feImage_ = feImage empty

feImage__
  :: String
  -> Domable
feImage__ t = feImage_ [ DC.text_ t ]
