module Deku.DOM.Elt.I where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data I_

i
  :: Array (Poll (Attribute I_))
  -> Array Nut
  -> Nut
i = DC.elementify2 "i"

i_
  :: Array Nut
  -> Nut
i_ = i empty

i__
  :: String
  -> Nut
i__ t = i_ [ DC.text t ]
