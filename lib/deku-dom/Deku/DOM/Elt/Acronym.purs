module Deku.DOM.Elt.Acronym where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Acronym_

acronym :: Array (FRP.Event.Event (Deku.Attribute.Attribute Acronym_)) -> Array Nut -> Nut
acronym = DC.elementify2 "acronym"

acronym_ :: Array Nut -> Nut
acronym_ = acronym empty

acronym__ :: String -> Nut
acronym__ t = acronym_ [ DC.text_ t ]
