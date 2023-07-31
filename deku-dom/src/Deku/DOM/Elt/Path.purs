module Deku.DOM.Elt.Path where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Path_

path :: Array (FRP.Event.Event (Deku.Attribute.Attribute Path_)) -> Array Nut -> Nut
path = DC.elementify2 "path"

path_ :: Array Nut -> Nut
path_ = path empty

path__ :: String -> Nut
path__ t = path_ [ DC.text_ t ]