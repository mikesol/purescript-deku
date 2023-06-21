module Deku.DOM.Elt.Center where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

center
  :: Array (Attribute Tags.Center_)
  -> Array Nut
  -> Nut
center = DC.elementify3 "center"

center_
  :: Array Nut
  -> Nut
center_ = center empty

center__
  :: String
  -> Nut
center__ t = center_ [ DC.text_ t ]
