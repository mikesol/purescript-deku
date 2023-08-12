module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Abbr_

abbr
  :: Array (Poll (Attribute Abbr_))
  -> Array Nut
  -> Nut
abbr = DC.elementify2 "abbr"

abbr_
  :: Array Nut
  -> Nut
abbr_ = abbr empty

abbr__
  :: String
  -> Nut
abbr__ t = abbr_ [ DC.text t ]
