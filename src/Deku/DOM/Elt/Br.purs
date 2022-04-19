module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Br_

br
  :: forall event payload
   . IsEvent event
  => event (Attribute Br_)
  -> Array (Element event payload)
  -> Element event payload
br = elementify "br"

br_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
br_ = br empty
