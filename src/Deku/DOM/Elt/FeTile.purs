module Deku.DOM.Elt.FeTile where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeTile_

feTile
  :: Event (Attribute FeTile_)
  -> Array Domable
  -> Domable
feTile = DC.elementify2 "feTile"

feTile_
  :: Array Domable
  -> Domable
feTile_ = feTile empty

feTile__
  :: String
  -> Domable
feTile__ t = feTile_ [ DC.text_ t ]
