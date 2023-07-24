module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Abbr_

abbr :: Array (FRP.Event.Event (Deku.Attribute.Attribute Abbr_)) -> Array Nut -> Nut
abbr = DC.elementify2 "abbr"

abbr_ :: Array Nut -> Nut
abbr_ = abbr empty

abbr__ :: String -> Nut
abbr__ t = abbr_ [ DC.text_ t ]
