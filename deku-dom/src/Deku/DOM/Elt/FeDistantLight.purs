module Deku.DOM.Elt.FeDistantLight where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeDistantLight_

feDistantLight
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeDistantLight_)) -> Array Nut -> Nut
feDistantLight = DC.elementify2 "feDistantLight"

feDistantLight_ :: Array Nut -> Nut
feDistantLight_ = feDistantLight empty

feDistantLight__ :: String -> Nut
feDistantLight__ t = feDistantLight_ [ DC.text_ t ]