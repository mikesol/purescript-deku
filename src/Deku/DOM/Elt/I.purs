module Deku.DOM.Elt.I where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data I_

i
  :: Event (Attribute I_)
  -> Array Domable
  -> Domable
i = DC.elementify2 "i"

i_
  :: Array Domable
  -> Domable
i_ = i empty

i__
  :: String
  -> Domable
i__ t = i_ [ DC.text_ t ]
