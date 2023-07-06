module Deku.DOM.Elt.Th where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Th_

th
  :: Array (Event (Attribute Th_))
  -> Array Nut
  -> Nut
th = DC.elementify2 "th"

th_
  :: Array Nut
  -> Nut
th_ = th empty

th__
  :: String
  -> Nut
th__ t = th_ [ DC.text_ t ]
