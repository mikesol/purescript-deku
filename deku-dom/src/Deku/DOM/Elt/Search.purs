module Deku.DOM.Elt.Search where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Search_

search :: Array (FRP.Event.Event (Deku.Attribute.Attribute Search_)) -> Array Nut -> Nut
search = DC.elementify2 "search"

search_ :: Array Nut -> Nut
search_ = search empty

search__ :: String -> Nut
search__ t = search_ [ DC.text_ t ]
