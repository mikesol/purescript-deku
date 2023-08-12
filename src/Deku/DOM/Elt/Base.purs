module Deku.DOM.Elt.Base where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Base_

base
  :: Array (Event (Attribute Base_))
  -> Array Nut
  -> Nut
base = DC.elementify2 "base"

base_
  :: Array Nut
  -> Nut
base_ = base empty

base__
  :: String
  -> Nut
base__ t = base_ [ DC.text_ t ]
