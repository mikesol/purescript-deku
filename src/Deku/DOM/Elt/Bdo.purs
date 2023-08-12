module Deku.DOM.Elt.Bdo where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Bdo_

bdo
  :: Array (Event (Attribute Bdo_))
  -> Array Nut
  -> Nut
bdo = DC.elementify2 "bdo"

bdo_
  :: Array Nut
  -> Nut
bdo_ = bdo empty

bdo__
  :: String
  -> Nut
bdo__ t = bdo_ [ DC.text_ t ]
