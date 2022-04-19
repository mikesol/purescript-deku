module Deku.DOM.Elt.Option where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Option_

option
  :: forall event payload
   . IsEvent event
  => event (Attribute Option_)
  -> Array (Element event payload)
  -> Element event payload
option = elementify "option"

option_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
option_ = option empty
