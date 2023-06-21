module Deku.DOM.Elt.FeTurbulence where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feTurbulence
  :: Array (Event (Attribute Tags.FeTurbulence_))
  -> Array Nut
  -> Nut
feTurbulence = DC.elementify3 "feTurbulence"

feTurbulence_
  :: Array Nut
  -> Nut
feTurbulence_ = feTurbulence empty

feTurbulence__
  :: String
  -> Nut
feTurbulence__ t = feTurbulence_ [ DC.text_ t ]
