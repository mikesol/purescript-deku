module Deku.DOM.Elt.Switch where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Switch_

switch
  :: Array (Poll (Attribute Switch_))
  -> Array Nut
  -> Nut
switch = DC.elementify2 "switch"

switch_
  :: Array Nut
  -> Nut
switch_ = switch empty

switch__
  :: String
  -> Nut
switch__ t = switch_ [ DC.text t ]
