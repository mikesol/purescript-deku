module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

bdi
  :: Array (Attribute Tags.Bdi_)
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
