module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Noframes_

noframes :: Array (FRP.Event.Event (Deku.Attribute.Attribute Noframes_)) -> Array Nut -> Nut
noframes = DC.elementify2 "noframes"

noframes_ :: Array Nut -> Nut
noframes_ = noframes empty

noframes__ :: String -> Nut
noframes__ t = noframes_ [ DC.text_ t ]
