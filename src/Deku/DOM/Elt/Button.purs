module Deku.DOM.Elt.Button where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Button_

button
  :: Array (Event (Attribute Button_))
  -> Array Nut
  -> Nut
button = DC.elementify2 "button"

button_
  :: Array Nut
  -> Nut
button_ = button empty

button__
  :: String
  -> Nut
button__ t = button_ [ DC.text_ t ]
