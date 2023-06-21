module Deku.DOM.Elt.FeSpotLight where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

feSpotLight
  :: Array (Attribute Tags.FeSpotLight_)
  -> Array Nut
  -> Nut
feSpotLight = DC.elementify3 "feSpotLight"

feSpotLight_
  :: Array Nut
  -> Nut
feSpotLight_ = feSpotLight empty

feSpotLight__
  :: String
  -> Nut
feSpotLight__ t = feSpotLight_ [ DC.text_ t ]
