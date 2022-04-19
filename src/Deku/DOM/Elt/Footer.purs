module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Footer_

footer
  :: forall event payload
   . IsEvent event
  => event (Attribute Footer_)
  -> Array (Element event payload)
  -> Element event payload
footer = elementify "footer"

footer_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
footer_ = footer empty
