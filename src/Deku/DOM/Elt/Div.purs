module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

div
  :: Array (Event (Attribute Tags.Div_))
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
