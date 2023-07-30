module Deku.DOM.Elt.FeTurbulence where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data FeTurbulence_

feTurbulence
  :: Array (Attribute FeTurbulence_)
  -> Array Nut
  -> Nut
feTurbulence = DC.elementify2 "feTurbulence"

feTurbulence_
  :: Array Nut
  -> Nut
feTurbulence_ = feTurbulence empty

feTurbulence__
  :: String
  -> Nut
feTurbulence__ t = feTurbulence_ [ DC.text_ t ]
