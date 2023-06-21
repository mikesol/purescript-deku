module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

p
  :: Array (Attribute Tags.P_)
  -> Array Nut
  -> Nut
p = DC.elementify3 "p"

p_
  :: Array Nut
  -> Nut
p_ = p empty

p__
  :: String
  -> Nut
p__ t = p_ [ DC.text_ t ]
