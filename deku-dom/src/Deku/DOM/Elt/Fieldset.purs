module Deku.DOM.Elt.Fieldset where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Fieldset_

fieldset :: Array (FRP.Event.Event (Deku.Attribute.Attribute Fieldset_)) -> Array Nut -> Nut
fieldset = DC.elementify2 "fieldset"

fieldset_ :: Array Nut -> Nut
fieldset_ = fieldset empty

fieldset__ :: String -> Nut
fieldset__ t = fieldset_ [ DC.text_ t ]
