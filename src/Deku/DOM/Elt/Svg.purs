module Deku.DOM.Elt.Svg where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

svg
  :: Array (Attribute Tags.Svg_)
  -> Array Nut
  -> Nut
svg = DC.elementify3 "svg"

svg_
  :: Array Nut
  -> Nut
svg_ = svg empty

svg__
  :: String
  -> Nut
svg__ t = svg_ [ DC.text_ t ]
