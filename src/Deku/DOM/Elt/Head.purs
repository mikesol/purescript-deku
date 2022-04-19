module Deku.DOM.Elt.Head where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Head_

head
  :: forall event payload
   . IsEvent event
  => event (Attribute Head_)
  -> Array (Element event payload)
  -> Element event payload
head = elementify "head"

head_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
head_ = head empty
