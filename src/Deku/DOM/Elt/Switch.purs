module Deku.DOM.Elt.Switch where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Switch_

switch
  :: Event (Attribute Switch_)
  -> Array Domable
  -> Domable
switch = DC.elementify2 "switch"

switch_
  :: Array Domable
  -> Domable
switch_ = switch empty

switch__
  :: String
  -> Domable
switch__ t = switch_ [ DC.text_ t ]
