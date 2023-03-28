module Deku.DOM.Elt.Th where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Th_

th
  :: Event (Attribute Th_)
  -> Array Domable
  -> Domable
th = DC.elementify2 "th"

th_
  :: Array Domable
  -> Domable
th_ = th empty

th__
  :: String
  -> Domable
th__ t = th_ [ DC.text_ t ]
