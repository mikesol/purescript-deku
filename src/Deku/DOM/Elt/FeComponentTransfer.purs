module Deku.DOM.Elt.FeComponentTransfer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeComponentTransfer_

feComponentTransfer
  :: Event (Attribute FeComponentTransfer_)
  -> Array Domable
  -> Domable
feComponentTransfer = DC.elementify2 "feComponentTransfer"

feComponentTransfer_
  :: Array Domable
  -> Domable
feComponentTransfer_ = feComponentTransfer empty

feComponentTransfer__
  :: String
  -> Domable
feComponentTransfer__ t = feComponentTransfer_ [ DC.text_ t ]
