module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

div
  :: Array (Attribute Tags.Div_)
  -> Array Nut
  -> Nut
div = DC.elementify3 "div"

div_
  :: Array Nut
  -> Nut
div_ = div empty

div__
  :: String
  -> Nut
div__ t = div_ [ DC.text_ t ]
