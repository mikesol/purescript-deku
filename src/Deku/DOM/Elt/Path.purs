module Deku.DOM.Elt.Path where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Path_

path
  :: Event (Attribute Path_)
  -> Array Domable
  -> Domable
path = DC.elementify2 "path"

path_
  :: Array Domable
  -> Domable
path_ = path empty

path__
  :: String
  -> Domable
path__ t = path_ [ DC.text_ t ]
