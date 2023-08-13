module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Div_

div
  :: Array (Poll (Attribute Div_))
  -> Array Nut
  -> Nut
div = DC.elementify2 "div"

div_
  :: Array Nut
  -> Nut
div_ = div empty

div__
  :: String
  -> Nut
div__ t = div_ [ DC.text_ t ]
