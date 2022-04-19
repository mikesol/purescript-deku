module Deku.DOM.Elt.Strong where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Strong_

strong
  :: forall event payload
   . IsEvent event
  => event (Attribute Strong_)
  -> Array (Element event payload)
  -> Element event payload
strong = elementify "strong"

strong_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
strong_ = strong empty
