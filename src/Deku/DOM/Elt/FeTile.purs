module Deku.DOM.Elt.FeTile where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data FeTile_

feTile
  :: Array (Attribute FeTile_)
  -> Array Nut
  -> Nut
feTile = DC.elementify2 "feTile"

feTile_
  :: Array Nut
  -> Nut
feTile_ = feTile empty

feTile__
  :: String
  -> Nut
feTile__ t = feTile_ [ DC.text_ t ]
