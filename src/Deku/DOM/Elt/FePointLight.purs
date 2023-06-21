module Deku.DOM.Elt.FePointLight where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

fePointLight
  :: Array (Event (Attribute Tags.FePointLight_))
  -> Array Nut
  -> Nut
fePointLight = DC.elementify3 "fePointLight"

fePointLight_
  :: Array Nut
  -> Nut
fePointLight_ = fePointLight empty

fePointLight__
  :: String
  -> Nut
fePointLight__ t = fePointLight_ [ DC.text_ t ]
