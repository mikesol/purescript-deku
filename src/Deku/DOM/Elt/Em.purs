module Deku.DOM.Elt.Em where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Em_

em
  :: forall event payload
   . IsEvent event
  => event (Attribute Em_)
  -> Array (Element event payload)
  -> Element event payload
em = elementify "em"

em_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
em_ = em empty
