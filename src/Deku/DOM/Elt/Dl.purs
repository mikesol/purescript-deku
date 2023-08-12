module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Dl_

dl
  :: Array (Poll (Attribute Dl_))
  -> Array Nut
  -> Nut
dl = DC.elementify2 "dl"

dl_
  :: Array Nut
  -> Nut
dl_ = dl empty

dl__
  :: String
  -> Nut
dl__ t = dl_ [ DC.text t ]
