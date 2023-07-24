module Deku.DOM.Elt.Hgroup where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Hgroup_

hgroup :: Array (FRP.Event.Event (Deku.Attribute.Attribute Hgroup_)) -> Array Nut -> Nut
hgroup = DC.elementify2 "hgroup"

hgroup_ :: Array Nut -> Nut
hgroup_ = hgroup empty

hgroup__ :: String -> Nut
hgroup__ t = hgroup_ [ DC.text_ t ]
