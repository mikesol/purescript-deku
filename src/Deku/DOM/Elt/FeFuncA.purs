module Deku.DOM.Elt.FeFuncA where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeFuncA_

feFuncA
  :: Event (Attribute FeFuncA_)
  -> Array Domable
  -> Domable
feFuncA = DC.elementify2 "feFuncA"

feFuncA_
  :: Array Domable
  -> Domable
feFuncA_ = feFuncA empty

feFuncA__
  :: String
  -> Domable
feFuncA__ t = feFuncA_ [ DC.text_ t ]
