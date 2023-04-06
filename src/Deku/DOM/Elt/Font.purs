module Deku.DOM.Elt.Font where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Font_

font
  :: Array (Event (Attribute Font_))
  -> Array Nut
  -> Nut
font = DC.elementify2 "font"

font_
  :: Array Nut
  -> Nut
font_ = font empty

font__
  :: String
  -> Nut
font__ t = font_ [ DC.text_ t ]
