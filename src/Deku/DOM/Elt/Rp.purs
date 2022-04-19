module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Rp_

rp
  :: forall event payload
   . IsEvent event
  => event (Attribute Rp_)
  -> Array (Element event payload)
  -> Element event payload
rp = elementify "rp"

rp_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
rp_ = rp empty
