module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Bdi_

bdi
  :: forall event payload
   . IsEvent event
  => event (Attribute Bdi_)
  -> Array (Element event payload)
  -> Element event payload
bdi = elementify "bdi"

bdi_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
bdi_ = bdi empty
