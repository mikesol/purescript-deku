module Deku.DOM.Elt.Aside where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Aside_

aside
  :: forall event payload
   . IsEvent event
  => event (Attribute Aside_)
  -> Array (Element event payload)
  -> Element event payload
aside = elementify "aside"

aside_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
aside_ = aside empty
