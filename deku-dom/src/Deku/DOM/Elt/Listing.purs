module Deku.DOM.Elt.Listing where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Listing_

listing :: Array (FRP.Event.Event (Deku.Attribute.Attribute Listing_)) -> Array Nut -> Nut
listing = DC.elementify2 "listing"

listing_ :: Array Nut -> Nut
listing_ = listing empty

listing__ :: String -> Nut
listing__ t = listing_ [ DC.text_ t ]
