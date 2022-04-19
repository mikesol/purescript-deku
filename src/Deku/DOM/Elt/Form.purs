module Deku.DOM.Elt.Form where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Form_

form
  :: forall event payload
   . IsEvent event
  => event (Attribute Form_)
  -> Array (Element event payload)
  -> Element event payload
form = elementify "form"

form_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
form_ = form empty
