module Deku.DOM.Elt.FeSpotLight where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeSpotLight_

feSpotLight
  :: Event (Attribute FeSpotLight_)
  -> Array Domable
  -> Domable
feSpotLight = DC.elementify2 "feSpotLight"

feSpotLight_
  :: Array Domable
  -> Domable
feSpotLight_ = feSpotLight empty

feSpotLight__
  :: String
  -> Domable
feSpotLight__ t = feSpotLight_ [ DC.text_ t ]
