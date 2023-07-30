module Deku.DOM.Elt.FeDiffuseLighting where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data FeDiffuseLighting_

feDiffuseLighting
  :: Array (Attribute FeDiffuseLighting_)
  -> Array Nut
  -> Nut
feDiffuseLighting = DC.elementify2 "feDiffuseLighting"

feDiffuseLighting_
  :: Array Nut
  -> Nut
feDiffuseLighting_ = feDiffuseLighting empty

feDiffuseLighting__
  :: String
  -> Nut
feDiffuseLighting__ t = feDiffuseLighting_ [ DC.text_ t ]
