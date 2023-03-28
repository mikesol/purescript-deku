module Deku.DOM.Elt.Noscript where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Noscript_

noscript
  :: Event (Attribute Noscript_)
  -> Array Domable
  -> Domable
noscript = DC.elementify2 "noscript"

noscript_
  :: Array Domable
  -> Domable
noscript_ = noscript empty

noscript__
  :: String
  -> Domable
noscript__ t = noscript_ [ DC.text_ t ]
