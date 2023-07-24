module Deku.DOM.Elt.Textarea where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Textarea_

textarea :: Array (FRP.Event.Event (Deku.Attribute.Attribute Textarea_)) -> Array Nut -> Nut
textarea = DC.elementify2 "textarea"

textarea_ :: Array Nut -> Nut
textarea_ = textarea empty

textarea__ :: String -> Nut
textarea__ t = textarea_ [ DC.text_ t ]
