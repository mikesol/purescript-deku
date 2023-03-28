module Deku.DOM.Elt.Set where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Set_

set
  :: Event (Attribute Set_)
  -> Array Domable
  -> Domable
set = DC.elementify2 "set"

set_
  :: Array Domable
  -> Domable
set_ = set empty

set__
  :: String
  -> Domable
set__ t = set_ [ DC.text_ t ]
