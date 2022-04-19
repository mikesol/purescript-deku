module Deku.DOM.Elt.Th where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Th_

th
  :: forall event payload
   . IsEvent event
  => event (Attribute Th_)
  -> Array (Element event payload)
  -> Element event payload
th = elementify "th"

th_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
th_ = th empty
