module Deku.DOM.Elt.Acronym where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Acronym_

acronym
  :: forall event payload
   . IsEvent event
  => event (Attribute Acronym_)
  -> Array (Element event payload)
  -> Element event payload
acronym = elementify "acronym"

acronym_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
acronym_ = acronym empty
