module Deku.DOM.Elt.FeTile where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeTile_

feTile :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeTile_)) -> Array Nut -> Nut
feTile = DC.elementify2 "feTile"

feTile_ :: Array Nut -> Nut
feTile_ = feTile empty

feTile__ :: String -> Nut
feTile__ t = feTile_ [ DC.text_ t ]
