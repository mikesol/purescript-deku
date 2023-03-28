module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Wbr_

wbr
  :: Event (Attribute Wbr_)
  -> Array Domable
  -> Domable
wbr = DC.elementify2 "wbr"

wbr_
  :: Array Domable
  -> Domable
wbr_ = wbr empty

wbr__
  :: String
  -> Domable
wbr__ t = wbr_ [ DC.text_ t ]
