module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Body_

body
  :: forall event payload
   . IsEvent event
  => event (Attribute Body_)
  -> Array (Element event payload)
  -> Element event payload
body = elementify "body"

body_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
body_ = body empty
