module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Input_

input
  :: forall event payload
   . IsEvent event
  => event (Attribute Input_)
  -> Array (Element event payload)
  -> Element event payload
input = elementify "input"

input_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
input_ = input empty
