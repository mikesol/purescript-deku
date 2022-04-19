module Deku.DOM.Elt.Section where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Section_

section
  :: forall event payload
   . IsEvent event
  => event (Attribute Section_)
  -> Array (Element event payload)
  -> Element event payload
section = elementify "section"

section_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
section_ = section empty
