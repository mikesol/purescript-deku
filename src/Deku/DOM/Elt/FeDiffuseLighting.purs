module Deku.DOM.Elt.FeDiffuseLighting where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feDiffuseLighting
  :: Array (Event (Attribute Tags.FeDiffuseLighting_))
  -> Array Nut
  -> Nut
feDiffuseLighting = DC.elementify3 "feDiffuseLighting"

feDiffuseLighting_
  :: Array Nut
  -> Nut
feDiffuseLighting_ = feDiffuseLighting empty

feDiffuseLighting__
  :: String
  -> Nut
feDiffuseLighting__ t = feDiffuseLighting_ [ DC.text_ t ]
