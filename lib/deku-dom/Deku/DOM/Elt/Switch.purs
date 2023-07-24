module Deku.DOM.Elt.Switch where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Switch_

switch :: Array (FRP.Event.Event (Deku.Attribute.Attribute Switch_)) -> Array Nut -> Nut
switch = DC.elementify2 "switch"

switch_ :: Array Nut -> Nut
switch_ = switch empty

switch__ :: String -> Nut
switch__ t = switch_ [ DC.text_ t ]
