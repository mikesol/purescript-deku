module Deku.DOM.Elt.Button where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Button_

button
  :: forall event payload
   . IsEvent event
  => event (Attribute Button_)
  -> Array (Element event payload)
  -> Element event payload
button = elementify "button"

button_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
button_ = button empty
