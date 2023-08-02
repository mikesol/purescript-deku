module Deku.DOM.Elt.Mpath where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Mpath_

mpath
  :: Array (Attribute Mpath_)
  -> Array Nut
  -> Nut
mpath = DC.elementify2 "mpath"

mpath_
  :: Array Nut
  -> Nut
mpath_ = mpath empty

mpath__
  :: String
  -> Nut
mpath__ t = mpath_ [ DC.text t ]
