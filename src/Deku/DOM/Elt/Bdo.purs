module Deku.DOM.Elt.Bdo where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Bdo_

bdo
  :: Event (Attribute Bdo_)
  -> Array Domable
  -> Domable
bdo = DC.elementify2 "bdo"

bdo_
  :: Array Domable
  -> Domable
bdo_ = bdo empty

bdo__
  :: String
  -> Domable
bdo__ t = bdo_ [ DC.text_ t ]
