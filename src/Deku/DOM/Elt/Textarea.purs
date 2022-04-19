module Deku.DOM.Elt.Textarea where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Textarea_

textarea
  :: forall event payload
   . IsEvent event
  => event (Attribute Textarea_)
  -> Array (Element event payload)
  -> Element event payload
textarea = elementify "textarea"

textarea_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
textarea_ = textarea empty
