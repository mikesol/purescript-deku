module Deku.DOM.Elt.Param where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Param_

param
  :: Event (Attribute Param_)
  -> Array Domable
  -> Domable
param = DC.elementify2 "param"

param_
  :: Array Domable
  -> Domable
param_ = param empty

param__
  :: String
  -> Domable
param__ t = param_ [ DC.text_ t ]
