module Deku.DOM.Elt.Line where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Line_

line
  :: Event (Attribute Line_)
  -> Array Domable
  -> Domable
line = DC.elementify2 "line"

line_
  :: Array Domable
  -> Domable
line_ = line empty

line__
  :: String
  -> Domable
line__ t = line_ [ DC.text_ t ]
