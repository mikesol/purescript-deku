module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Dialog_

dialog :: Array (FRP.Event.Event (Deku.Attribute.Attribute Dialog_)) -> Array Nut -> Nut
dialog = DC.elementify2 "dialog"

dialog_ :: Array Nut -> Nut
dialog_ = dialog empty

dialog__ :: String -> Nut
dialog__ t = dialog_ [ DC.text_ t ]
