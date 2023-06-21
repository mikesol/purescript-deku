module Deku.DOM.Elt.S where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

s
  :: Array (Event (Attribute Tags.S_))
  -> Array Nut
  -> Nut
s = DC.elementify3 "s"

s_
  :: Array Nut
  -> Nut
s_ = s empty

s__
  :: String
  -> Nut
s__ t = s_ [ DC.text_ t ]
