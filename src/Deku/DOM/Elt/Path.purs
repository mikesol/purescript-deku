module Deku.DOM.Elt.Path where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Path_

path
  :: Array (Poll (Attribute Path_))
  -> Array Nut
  -> Nut
path = DC.elementify2 "path"

path_
  :: Array Nut
  -> Nut
path_ = path empty

path__
  :: String
  -> Nut
path__ t = path_ [ DC.text t ]
