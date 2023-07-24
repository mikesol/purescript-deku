module Deku.DOM.Elt.Dfn where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Dfn_

dfn :: Array (FRP.Event.Event (Deku.Attribute.Attribute Dfn_)) -> Array Nut -> Nut
dfn = DC.elementify2 "dfn"

dfn_ :: Array Nut -> Nut
dfn_ = dfn empty

dfn__ :: String -> Nut
dfn__ t = dfn_ [ DC.text_ t ]
