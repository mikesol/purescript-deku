module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Td_

td
  :: forall event payload
   . IsEvent event
  => event (Attribute Td_)
  -> Array (Element event payload)
  -> Element event payload
td = elementify "td"

td_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
td_ = td empty
