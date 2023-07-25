module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Big_

big :: Array (FRP.Event.Event (Deku.Attribute.Attribute Big_)) -> Array Nut -> Nut
big = DC.elementify2 "big"

big_ :: Array Nut -> Nut
big_ = big empty

big__ :: String -> Nut
big__ t = big_ [ DC.text_ t ]
