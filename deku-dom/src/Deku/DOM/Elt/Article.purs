module Deku.DOM.Elt.Article where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Article_

article :: Array (FRP.Event.Event (Deku.Attribute.Attribute Article_)) -> Array Nut -> Nut
article = DC.elementify2 "article"

article_ :: Array Nut -> Nut
article_ = article empty

article__ :: String -> Nut
article__ t = article_ [ DC.text_ t ]
