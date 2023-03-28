module Deku.DOM.Elt.Svg where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Svg_

svg
  :: Event (Attribute Svg_)
  -> Array Domable
  -> Domable
svg = DC.elementify2 "svg"

svg_
  :: Array Domable
  -> Domable
svg_ = svg empty

svg__
  :: String
  -> Domable
svg__ t = svg_ [ DC.text_ t ]
