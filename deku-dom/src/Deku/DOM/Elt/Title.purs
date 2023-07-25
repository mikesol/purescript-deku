module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Title_

title :: Array (FRP.Event.Event (Deku.Attribute.Attribute Title_)) -> Array Nut -> Nut
title = DC.elementify2 "title"

title_ :: Array Nut -> Nut
title_ = title empty

title__ :: String -> Nut
title__ t = title_ [ DC.text_ t ]
