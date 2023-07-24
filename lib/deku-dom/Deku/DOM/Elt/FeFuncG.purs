module Deku.DOM.Elt.FeFuncG where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeFuncG_

feFuncG :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeFuncG_)) -> Array Nut -> Nut
feFuncG = DC.elementify2 "feFuncG"

feFuncG_ :: Array Nut -> Nut
feFuncG_ = feFuncG empty

feFuncG__ :: String -> Nut
feFuncG__ t = feFuncG_ [ DC.text_ t ]
