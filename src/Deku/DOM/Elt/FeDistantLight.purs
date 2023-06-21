module Deku.DOM.Elt.FeDistantLight where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feDistantLight
  :: Array (Event (Attribute Tags.FeDistantLight_))
  -> Array Nut
  -> Nut
feDistantLight = DC.elementify3 "feDistantLight"

feDistantLight_
  :: Array Nut
  -> Nut
feDistantLight_ = feDistantLight empty

feDistantLight__
  :: String
  -> Nut
feDistantLight__ t = feDistantLight_ [ DC.text_ t ]
