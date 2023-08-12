module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Cite_

cite
  :: Array (Poll (Attribute Cite_))
  -> Array Nut
  -> Nut
cite = DC.elementify2 "cite"

cite_
  :: Array Nut
  -> Nut
cite_ = cite empty

cite__
  :: String
  -> Nut
cite__ t = cite_ [ DC.text t ]
