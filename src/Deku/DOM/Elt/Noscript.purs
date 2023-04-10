module Deku.DOM.Elt.Noscript where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Noscript_

noscript
  :: Array (Event (Attribute Noscript_))
  -> Array Nut
  -> Nut
noscript = DC.elementify2 "noscript"

noscript_
  :: Array Nut
  -> Nut
noscript_ = noscript empty

noscript__
  :: String
  -> Nut
noscript__ t = noscript_ [ DC.text_ t ]
