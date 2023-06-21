module Deku.DOM.Elt.ClipPath where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

clipPath
  :: Array (Attribute Tags.ClipPath_)
  -> Array Nut
  -> Nut
clipPath = DC.elementify3 "clipPath"

clipPath_
  :: Array Nut
  -> Nut
clipPath_ = clipPath empty

clipPath__
  :: String
  -> Nut
clipPath__ t = clipPath_ [ DC.text_ t ]
