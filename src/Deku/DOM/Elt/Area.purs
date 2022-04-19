module Deku.DOM.Elt.Area where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Area_

area
  :: forall event payload
   . IsEvent event
  => event (Attribute Area_)
  -> Array (Element event payload)
  -> Element event payload
area = elementify "area"

area_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
area_ = area empty
