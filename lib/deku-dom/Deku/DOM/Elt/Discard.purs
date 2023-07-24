module Deku.DOM.Elt.Discard where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Discard_

discard :: Array (FRP.Event.Event (Deku.Attribute.Attribute Discard_)) -> Array Nut -> Nut
discard = DC.elementify2 "discard"

discard_ :: Array Nut -> Nut
discard_ = discard empty

discard__ :: String -> Nut
discard__ t = discard_ [ DC.text_ t ]
