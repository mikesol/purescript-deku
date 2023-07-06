module Deku.DOM.Elt.FeFuncA where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data FeFuncA_

feFuncA
  :: Array (Event (Attribute FeFuncA_))
  -> Array Nut
  -> Nut
feFuncA = DC.elementify2 "feFuncA"

feFuncA_
  :: Array Nut
  -> Nut
feFuncA_ = feFuncA empty

feFuncA__
  :: String
  -> Nut
feFuncA__ t = feFuncA_ [ DC.text_ t ]
