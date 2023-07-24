module Deku.DOM.Elt.Select where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Select_

select :: Array (FRP.Event.Event (Deku.Attribute.Attribute Select_)) -> Array Nut -> Nut
select = DC.elementify2 "select"

select_ :: Array Nut -> Nut
select_ = select empty

select__ :: String -> Nut
select__ t = select_ [ DC.text_ t ]
