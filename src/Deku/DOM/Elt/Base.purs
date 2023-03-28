module Deku.DOM.Elt.Base where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Base_

base
  :: Event (Attribute Base_)
  -> Array Domable
  -> Domable
base = DC.elementify2 "base"

base_
  :: Array Domable
  -> Domable
base_ = base empty

base__
  :: String
  -> Domable
base__ t = base_ [ DC.text_ t ]
