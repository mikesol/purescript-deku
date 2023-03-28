module Deku.DOM.Elt.Mpath where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Mpath_

mpath
  :: Event (Attribute Mpath_)
  -> Array Domable
  -> Domable
mpath = DC.elementify2 "mpath"

mpath_
  :: Array Domable
  -> Domable
mpath_ = mpath empty

mpath__
  :: String
  -> Domable
mpath__ t = mpath_ [ DC.text_ t ]
