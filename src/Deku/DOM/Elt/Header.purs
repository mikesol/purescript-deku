module Deku.DOM.Elt.Header where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Header_

header
  :: forall event payload
   . IsEvent event
  => event (Attribute Header_)
  -> Array (Element event payload)
  -> Element event payload
header = elementify "header"

header_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
header_ = header empty
