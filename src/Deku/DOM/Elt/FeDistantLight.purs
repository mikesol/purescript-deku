module Deku.DOM.Elt.FeDistantLight where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeDistantLight_

feDistantLight
  :: Event (Attribute FeDistantLight_)
  -> Array Domable
  -> Domable
feDistantLight = DC.elementify2 "feDistantLight"

feDistantLight_
  :: Array Domable
  -> Domable
feDistantLight_ = feDistantLight empty

feDistantLight__
  :: String
  -> Domable
feDistantLight__ t = feDistantLight_ [ DC.text_ t ]
