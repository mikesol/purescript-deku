module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data Input_

input
  :: Array (Attribute Input_)
  -> Array Nut
  -> Nut
input = DC.elementify2 "input"

input_
  :: Array Nut
  -> Nut
input_ = input empty

input__
  :: String
  -> Nut
input__ t = input_ [ DC.text_ t ]
