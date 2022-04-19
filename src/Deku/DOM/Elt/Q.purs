module Deku.DOM.Elt.Q where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Q_

q
  :: forall event payload
   . IsEvent event
  => event (Attribute Q_)
  -> Array (Element event payload)
  -> Element event payload
q = elementify "q"

q_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
q_ = q empty
