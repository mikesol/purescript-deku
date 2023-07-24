module Deku.DOM.Elt.FeFuncB where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeFuncB_

feFuncB :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeFuncB_)) -> Array Nut -> Nut
feFuncB = DC.elementify2 "feFuncB"

feFuncB_ :: Array Nut -> Nut
feFuncB_ = feFuncB empty

feFuncB__ :: String -> Nut
feFuncB__ t = feFuncB_ [ DC.text_ t ]
