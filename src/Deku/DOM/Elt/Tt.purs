module Deku.DOM.Elt.Tt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Tt_

tt
  :: Event (Attribute Tt_)
  -> Array Domable
  -> Domable
tt = DC.elementify2 "tt"

tt_
  :: Array Domable
  -> Domable
tt_ = tt empty

tt__
  :: String
  -> Domable
tt__ t = tt_ [ DC.text_ t ]
