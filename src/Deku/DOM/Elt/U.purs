module Deku.DOM.Elt.U where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data U_

u
  :: forall event payload
   . IsEvent event
  => event (Attribute U_)
  -> Array (Element event payload)
  -> Element event payload
u = elementify "u"

u_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
u_ = u empty
