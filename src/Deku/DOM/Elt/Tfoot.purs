module Deku.DOM.Elt.Tfoot where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Tfoot_

tfoot
  :: forall event payload
   . IsEvent event
  => event (Attribute Tfoot_)
  -> Array (Element event payload)
  -> Element event payload
tfoot = elementify "tfoot"

tfoot_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
tfoot_ = tfoot empty
