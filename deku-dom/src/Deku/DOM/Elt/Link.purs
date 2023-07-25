module Deku.DOM.Elt.Link where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Link_

link :: Array (FRP.Event.Event (Deku.Attribute.Attribute Link_)) -> Array Nut -> Nut
link = DC.elementify2 "link"

link_ :: Array Nut -> Nut
link_ = link empty

link__ :: String -> Nut
link__ t = link_ [ DC.text_ t ]
