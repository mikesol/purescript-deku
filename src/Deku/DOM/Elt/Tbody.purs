module Deku.DOM.Elt.Tbody where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Tbody_

tbody
  :: forall event payload
   . IsEvent event
  => event (Attribute Tbody_)
  -> Array (Element event payload)
  -> Element event payload
tbody = elementify "tbody"

tbody_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
tbody_ = tbody empty
