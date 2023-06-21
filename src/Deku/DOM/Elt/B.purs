module Deku.DOM.Elt.B where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

b
  :: Array (Event (Attribute Tags.B_))
  -> Array Nut
  -> Nut
b = DC.elementify3 "b"

b_
  :: Array Nut
  -> Nut
b_ = b empty

b__
  :: String
  -> Nut
b__ t = b_ [ DC.text_ t ]
