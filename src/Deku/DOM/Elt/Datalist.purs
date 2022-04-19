module Deku.DOM.Elt.Datalist where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Datalist_

datalist
  :: forall event payload
   . IsEvent event
  => event (Attribute Datalist_)
  -> Array (Element event payload)
  -> Element event payload
datalist = elementify "datalist"

datalist_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
datalist_ = datalist empty
