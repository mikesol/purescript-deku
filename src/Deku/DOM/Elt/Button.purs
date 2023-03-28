module Deku.DOM.Elt.Button where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Button_

button
  :: Event (Attribute Button_)
  -> Array Domable
  -> Domable
button = DC.elementify2 "button"

button_
  :: Array Domable
  -> Domable
button_ = button empty

button__
  :: String
  -> Domable
button__ t = button_ [ DC.text_ t ]
