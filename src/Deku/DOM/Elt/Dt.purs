module Deku.DOM.Elt.Dt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Dt_

dt
  :: forall event payload
   . IsEvent event
  => event (Attribute Dt_)
  -> Array (Element event payload)
  -> Element event payload
dt = elementify "dt"

dt_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
dt_ = dt empty
