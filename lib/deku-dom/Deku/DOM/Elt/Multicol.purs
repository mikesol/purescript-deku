module Deku.DOM.Elt.Multicol where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Multicol_

multicol :: Array (FRP.Event.Event (Deku.Attribute.Attribute Multicol_)) -> Array Nut -> Nut
multicol = DC.elementify2 "multicol"

multicol_ :: Array Nut -> Nut
multicol_ = multicol empty

multicol__ :: String -> Nut
multicol__ t = multicol_ [ DC.text_ t ]
