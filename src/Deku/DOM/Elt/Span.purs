module Deku.DOM.Elt.Span where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Span_

span
  :: forall event payload
   . IsEvent event
  => event (Attribute Span_)
  -> Array (Element event payload)
  -> Element event payload
span = elementify "span"

span_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
span_ = span empty
