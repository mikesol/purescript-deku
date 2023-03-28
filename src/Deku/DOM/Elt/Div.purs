module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Div_

div
  :: Event (Attribute Div_)
  -> Array Domable
  -> Domable
div = DC.elementify2 "div"

div_
  :: Array Domable
  -> Domable
div_ = div empty

div__
  :: String
  -> Domable
div__ t = div_ [ DC.text_ t ]
