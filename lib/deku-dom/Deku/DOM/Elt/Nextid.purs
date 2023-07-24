module Deku.DOM.Elt.Nextid where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Nextid_

nextid :: Array (FRP.Event.Event (Deku.Attribute.Attribute Nextid_)) -> Array Nut -> Nut
nextid = DC.elementify2 "nextid"

nextid_ :: Array Nut -> Nut
nextid_ = nextid empty

nextid__ :: String -> Nut
nextid__ t = nextid_ [ DC.text_ t ]
