module Deku.DOM.Elt.Bgsound where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Bgsound_

bgsound :: Array (FRP.Event.Event (Deku.Attribute.Attribute Bgsound_)) -> Array Nut -> Nut
bgsound = DC.elementify2 "bgsound"

bgsound_ :: Array Nut -> Nut
bgsound_ = bgsound empty

bgsound__ :: String -> Nut
bgsound__ t = bgsound_ [ DC.text_ t ]
