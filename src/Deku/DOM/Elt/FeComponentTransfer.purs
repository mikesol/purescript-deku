module Deku.DOM.Elt.FeComponentTransfer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feComponentTransfer
  :: Array (Event (Attribute Tags.FeComponentTransfer_))
  -> Array Nut
  -> Nut
feComponentTransfer = DC.elementify3 "feComponentTransfer"

feComponentTransfer_
  :: Array Nut
  -> Nut
feComponentTransfer_ = feComponentTransfer empty

feComponentTransfer__
  :: String
  -> Nut
feComponentTransfer__ t = feComponentTransfer_ [ DC.text_ t ]
