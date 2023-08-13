module Deku.DOM.Elt.FePointLight where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data FePointLight_

fePointLight
  :: Array (Poll (Attribute FePointLight_))
  -> Array Nut
  -> Nut
fePointLight = DC.elementify2 "fePointLight"

fePointLight_
  :: Array Nut
  -> Nut
fePointLight_ = fePointLight empty

fePointLight__
  :: String
  -> Nut
fePointLight__ t = fePointLight_ [ DC.text_ t ]
