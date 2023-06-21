module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

input
  :: Array (Attribute Tags.Input_)
  -> Array Nut
  -> Nut
input = DC.elementify3 "input"

input_
  :: Array Nut
  -> Nut
input_ = input empty

input__
  :: String
  -> Nut
input__ t = input_ [ DC.text_ t ]
