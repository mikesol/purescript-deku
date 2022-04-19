module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Div_

div
  :: forall event payload
   . IsEvent event
  => event (Attribute Div_)
  -> Array (Element event payload)
  -> Element event payload
div = elementify "div"

div_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
div_ = div empty
