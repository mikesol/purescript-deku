module Deku.DOM.Elt.Font where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Font_

font
  :: forall event payload
   . IsEvent event
  => event (Attribute Font_)
  -> Array (Element event payload)
  -> Element event payload
font = elementify "font"

font_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
font_ = font empty
