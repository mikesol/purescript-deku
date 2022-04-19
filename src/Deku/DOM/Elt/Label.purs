module Deku.DOM.Elt.Label where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Label_

label
  :: forall event payload
   . IsEvent event
  => event (Attribute Label_)
  -> Array (Element event payload)
  -> Element event payload
label = elementify "label"

label_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
label_ = label empty
