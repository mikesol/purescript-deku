module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Template_

template
  :: forall event payload
   . IsEvent event
  => event (Attribute Template_)
  -> Array (Element event payload)
  -> Element event payload
template = elementify "template"

template_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
template_ = template empty
