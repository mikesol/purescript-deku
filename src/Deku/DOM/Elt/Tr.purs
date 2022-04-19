module Deku.DOM.Elt.Tr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Tr_

tr
  :: forall event payload
   . IsEvent event
  => event (Attribute Tr_)
  -> Array (Element event payload)
  -> Element event payload
tr = elementify "tr"

tr_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
tr_ = tr empty
