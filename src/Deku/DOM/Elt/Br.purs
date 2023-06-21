module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

br
  :: Array (Event (Attribute Tags.Br_))
  -> Array Nut
  -> Nut
br = DC.elementify3 "br"

br_
  :: Array Nut
  -> Nut
br_ = br empty

br__
  :: String
  -> Nut
br__ t = br_ [ DC.text_ t ]
