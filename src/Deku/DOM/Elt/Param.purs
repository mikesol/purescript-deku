module Deku.DOM.Elt.Param where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Param_

param
  :: forall event payload
   . IsEvent event
  => event (Attribute Param_)
  -> Array (Element event payload)
  -> Element event payload
param = elementify "param"

param_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
param_ = param empty
