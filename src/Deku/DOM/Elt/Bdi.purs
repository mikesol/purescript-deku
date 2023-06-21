module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

bdi
  :: Array (Event (Attribute Tags.Bdi_))
  -> Array Nut
  -> Nut
bdi = DC.elementify3 "bdi"

bdi_
  :: Array Nut
  -> Nut
bdi_ = bdi empty

bdi__
  :: String
  -> Nut
bdi__ t = bdi_ [ DC.text_ t ]
