module Deku.DOM.Elt.FeDiffuseLighting where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeDiffuseLighting_

feDiffuseLighting
  :: Event (Attribute FeDiffuseLighting_)
  -> Array Domable
  -> Domable
feDiffuseLighting = DC.elementify2 "feDiffuseLighting"

feDiffuseLighting_
  :: Array Domable
  -> Domable
feDiffuseLighting_ = feDiffuseLighting empty

feDiffuseLighting__
  :: String
  -> Domable
feDiffuseLighting__ t = feDiffuseLighting_ [ DC.text_ t ]
