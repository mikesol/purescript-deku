module Deku.DOM.Elt.FePointLight where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FePointLight_

fePointLight
  :: Event (Attribute FePointLight_)
  -> Array Domable
  -> Domable
fePointLight = DC.elementify2 "fePointLight"

fePointLight_
  :: Array Domable
  -> Domable
fePointLight_ = fePointLight empty

fePointLight__
  :: String
  -> Domable
fePointLight__ t = fePointLight_ [ DC.text_ t ]
