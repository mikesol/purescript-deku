module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Canvas_

canvas
  :: forall event payload
   . IsEvent event
  => event (Attribute Canvas_)
  -> Array (Element event payload)
  -> Element event payload
canvas = elementify "canvas"

canvas_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
canvas_ = canvas empty
