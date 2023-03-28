module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Input_

input
  :: Event (Attribute Input_)
  -> Array Domable
  -> Domable
input = DC.elementify2 "input"

input_
  :: Array Domable
  -> Domable
input_ = input empty

input__
  :: String
  -> Domable
input__ t = input_ [ DC.text_ t ]
