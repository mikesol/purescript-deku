module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Bdi_

bdi
  :: Event (Attribute Bdi_)
  -> Array Domable
  -> Domable
bdi = DC.elementify2 "bdi"

bdi_
  :: Array Domable
  -> Domable
bdi_ = bdi empty

bdi__
  :: String
  -> Domable
bdi__ t = bdi_ [ DC.text_ t ]
