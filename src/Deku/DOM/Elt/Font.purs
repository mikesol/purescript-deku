module Deku.DOM.Elt.Font where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Font_

font
  :: Event (Attribute Font_)
  -> Array Domable
  -> Domable
font = DC.elementify2 "font"

font_
  :: Array Domable
  -> Domable
font_ = font empty

font__
  :: String
  -> Domable
font__ t = font_ [ DC.text_ t ]
