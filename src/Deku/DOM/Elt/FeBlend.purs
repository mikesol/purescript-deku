module Deku.DOM.Elt.FeBlend where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feBlend
  :: Array (Event (Attribute Tags.FeBlend_))
  -> Array Nut
  -> Nut
feBlend = DC.elementify3 "feBlend"

feBlend_
  :: Array Nut
  -> Nut
feBlend_ = feBlend empty

feBlend__
  :: String
  -> Nut
feBlend__ t = feBlend_ [ DC.text_ t ]
