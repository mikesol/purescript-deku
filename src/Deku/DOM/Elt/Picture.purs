module Deku.DOM.Elt.Picture where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Picture_

picture
  :: forall event payload
   . IsEvent event
  => event (Attribute Picture_)
  -> Array (Element event payload)
  -> Element event payload
picture = elementify "picture"

picture_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
picture_ = picture empty
