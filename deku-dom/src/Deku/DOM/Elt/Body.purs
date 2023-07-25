module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Body_

body :: Array (FRP.Event.Event (Deku.Attribute.Attribute Body_)) -> Array Nut -> Nut
body = DC.elementify2 "body"

body_ :: Array Nut -> Nut
body_ = body empty

body__ :: String -> Nut
body__ t = body_ [ DC.text_ t ]
