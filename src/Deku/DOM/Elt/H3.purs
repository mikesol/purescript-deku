module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

h3
  :: Array (Event (Attribute Tags.H3_))
  -> Array Nut
  -> Nut
h3 = DC.elementify3 "h3"

h3_
  :: Array Nut
  -> Nut
h3_ = h3 empty

h3__
  :: String
  -> Nut
h3__ t = h3_ [ DC.text_ t ]
