module Deku.DOM.Elt.Sup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Sup_

sup
  :: Event (Attribute Sup_)
  -> Array Domable
  -> Domable
sup = DC.elementify2 "sup"

sup_
  :: Array Domable
  -> Domable
sup_ = sup empty

sup__
  :: String
  -> Domable
sup__ t = sup_ [ DC.text_ t ]
