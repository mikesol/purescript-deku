module Deku.DOM.Elt.FeTurbulence where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeTurbulence_

feTurbulence
  :: Event (Attribute FeTurbulence_)
  -> Array Domable
  -> Domable
feTurbulence = DC.elementify2 "feTurbulence"

feTurbulence_
  :: Array Domable
  -> Domable
feTurbulence_ = feTurbulence empty

feTurbulence__
  :: String
  -> Domable
feTurbulence__ t = feTurbulence_ [ DC.text_ t ]
