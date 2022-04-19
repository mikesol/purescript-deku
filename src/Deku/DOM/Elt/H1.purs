module Deku.DOM.Elt.H1 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data H1_

h1
  :: forall event payload
   . IsEvent event
  => event (Attribute H1_)
  -> Array (Element event payload)
  -> Element event payload
h1 = elementify "h1"

h1_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
h1_ = h1 empty
