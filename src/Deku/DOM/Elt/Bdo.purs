module Deku.DOM.Elt.Bdo where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

bdo
  :: Array (Event (Attribute Tags.Bdo_))
  -> Array Nut
  -> Nut
bdo = DC.elementify3 "bdo"

bdo_
  :: Array Nut
  -> Nut
bdo_ = bdo empty

bdo__
  :: String
  -> Nut
bdo__ t = bdo_ [ DC.text_ t ]
