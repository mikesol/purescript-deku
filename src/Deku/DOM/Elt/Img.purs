module Deku.DOM.Elt.Img where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Img_

img
  :: forall event payload
   . IsEvent event
  => event (Attribute Img_)
  -> Array (Element event payload)
  -> Element event payload
img = elementify "img"

img_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
img_ = img empty
