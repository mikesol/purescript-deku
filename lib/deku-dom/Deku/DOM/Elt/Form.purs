module Deku.DOM.Elt.Form where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Form_

form :: Array (FRP.Event.Event (Deku.Attribute.Attribute Form_)) -> Array Nut -> Nut
form = DC.elementify2 "form"

form_ :: Array Nut -> Nut
form_ = form empty

form__ :: String -> Nut
form__ t = form_ [ DC.text_ t ]
