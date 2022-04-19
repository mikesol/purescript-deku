module Deku.DOM.Elt.Thead where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Thead_

thead
  :: forall event payload
   . IsEvent event
  => event (Attribute Thead_)
  -> Array (Element event payload)
  -> Element event payload
thead = elementify "thead"

thead_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
thead_ = thead empty
