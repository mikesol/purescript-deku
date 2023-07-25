module Deku.DOM.Elt.Aside where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Aside_

aside :: Array (FRP.Event.Event (Deku.Attribute.Attribute Aside_)) -> Array Nut -> Nut
aside = DC.elementify2 "aside"

aside_ :: Array Nut -> Nut
aside_ = aside empty

aside__ :: String -> Nut
aside__ t = aside_ [ DC.text_ t ]
