module Deku.DOM.Elt.Mpath where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Mpath_

mpath :: Array (FRP.Event.Event (Deku.Attribute.Attribute Mpath_)) -> Array Nut -> Nut
mpath = DC.elementify2 "mpath"

mpath_ :: Array Nut -> Nut
mpath_ = mpath empty

mpath__ :: String -> Nut
mpath__ t = mpath_ [ DC.text_ t ]
