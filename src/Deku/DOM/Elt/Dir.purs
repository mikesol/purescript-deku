module Deku.DOM.Elt.Dir where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Dir_

dir
  :: Event (Attribute Dir_)
  -> Array Domable
  -> Domable
dir = DC.elementify2 "dir"

dir_
  :: Array Domable
  -> Domable
dir_ = dir empty

dir__
  :: String
  -> Domable
dir__ t = dir_ [ DC.text_ t ]
