module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data P_

p
  :: forall event payload
   . IsEvent event
  => event (Attribute P_)
  -> Array (Element event payload)
  -> Element event payload
p = elementify "p"

p_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
p_ = p empty
