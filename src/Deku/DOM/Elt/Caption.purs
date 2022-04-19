module Deku.DOM.Elt.Caption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Caption_

caption
  :: forall event payload
   . IsEvent event
  => event (Attribute Caption_)
  -> Array (Element event payload)
  -> Element event payload
caption = elementify "caption"

caption_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
caption_ = caption empty
