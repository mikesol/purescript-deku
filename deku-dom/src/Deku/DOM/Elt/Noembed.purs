module Deku.DOM.Elt.Noembed where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Noembed_

noembed :: Array (FRP.Event.Event (Deku.Attribute.Attribute Noembed_)) -> Array Nut -> Nut
noembed = DC.elementify2 "noembed"

noembed_ :: Array Nut -> Nut
noembed_ = noembed empty

noembed__ :: String -> Nut
noembed__ t = noembed_ [ DC.text_ t ]
