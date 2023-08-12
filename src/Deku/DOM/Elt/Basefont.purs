module Deku.DOM.Elt.Basefont where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Basefont_

basefont
  :: Array (Poll (Attribute Basefont_))
  -> Array Nut
  -> Nut
basefont = DC.elementify2 "basefont"

basefont_
  :: Array Nut
  -> Nut
basefont_ = basefont empty

basefont__
  :: String
  -> Nut
basefont__ t = basefont_ [ DC.text t ]
