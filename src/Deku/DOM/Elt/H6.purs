module Deku.DOM.Elt.H6 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

h6
  :: Array (Event (Attribute Tags.H6_))
  -> Array Nut
  -> Nut
h6 = DC.elementify3 "h6"

h6_
  :: Array Nut
  -> Nut
h6_ = h6 empty

h6__
  :: String
  -> Nut
h6__ t = h6_ [ DC.text_ t ]
