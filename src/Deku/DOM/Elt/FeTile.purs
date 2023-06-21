module Deku.DOM.Elt.FeTile where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

feTile
  :: Array (Attribute Tags.FeTile_)
  -> Array Nut
  -> Nut
feTile = DC.elementify3 "feTile"

feTile_
  :: Array Nut
  -> Nut
feTile_ = feTile empty

feTile__
  :: String
  -> Nut
feTile__ t = feTile_ [ DC.text_ t ]
