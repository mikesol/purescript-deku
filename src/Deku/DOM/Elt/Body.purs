module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Body_

body
  :: Array (Poll (Attribute Body_))
  -> Array Nut
  -> Nut
body = DC.elementify2 "body"

body_
  :: Array Nut
  -> Nut
body_ = body empty

body__
  :: String
  -> Nut
body__ t = body_ [ DC.text t ]
