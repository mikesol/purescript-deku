module Deku.DOM.Elt.FeFuncB where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeFuncB_

feFuncB
  :: Event (Attribute FeFuncB_)
  -> Array Domable
  -> Domable
feFuncB = DC.elementify2 "feFuncB"

feFuncB_
  :: Array Domable
  -> Domable
feFuncB_ = feFuncB empty

feFuncB__
  :: String
  -> Domable
feFuncB__ t = feFuncB_ [ DC.text_ t ]
