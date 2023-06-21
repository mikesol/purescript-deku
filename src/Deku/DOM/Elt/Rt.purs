module Deku.DOM.Elt.Rt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

rt
  :: Array (Event (Attribute Tags.Rt_))
  -> Array Nut
  -> Nut
rt = DC.elementify3 "rt"

rt_
  :: Array Nut
  -> Nut
rt_ = rt empty

rt__
  :: String
  -> Nut
rt__ t = rt_ [ DC.text_ t ]
