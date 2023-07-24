module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Html_

html :: Array (FRP.Event.Event (Deku.Attribute.Attribute Html_)) -> Array Nut -> Nut
html = DC.elementify2 "html"

html_ :: Array Nut -> Nut
html_ = html empty

html__ :: String -> Nut
html__ t = html_ [ DC.text_ t ]
