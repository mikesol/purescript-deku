module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Cite_

cite :: Array (FRP.Event.Event (Deku.Attribute.Attribute Cite_)) -> Array Nut -> Nut
cite = DC.elementify2 "cite"

cite_ :: Array Nut -> Nut
cite_ = cite empty

cite__ :: String -> Nut
cite__ t = cite_ [ DC.text_ t ]
