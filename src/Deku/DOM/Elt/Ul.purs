module Deku.DOM.Elt.Ul where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

ul
  :: Array (Event (Attribute Tags.Ul_))
  -> Array Nut
  -> Nut
ul = DC.elementify3 "ul"

ul_
  :: Array Nut
  -> Nut
ul_ = ul empty

ul__
  :: String
  -> Nut
ul__ t = ul_ [ DC.text_ t ]
