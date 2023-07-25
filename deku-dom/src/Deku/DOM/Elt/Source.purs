module Deku.DOM.Elt.Source where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Source_

source :: Array (FRP.Event.Event (Deku.Attribute.Attribute Source_)) -> Array Nut -> Nut
source = DC.elementify2 "source"

source_ :: Array Nut -> Nut
source_ = source empty

source__ :: String -> Nut
source__ t = source_ [ DC.text_ t ]
