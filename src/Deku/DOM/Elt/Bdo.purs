module Deku.DOM.Elt.Bdo where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Bdo_

bdo
  :: forall event payload
   . IsEvent event
  => event (Attribute Bdo_)
  -> Array (Element event payload)
  -> Element event payload
bdo = elementify "bdo"

bdo_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
bdo_ = bdo empty
