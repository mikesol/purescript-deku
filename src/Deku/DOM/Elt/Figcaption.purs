module Deku.DOM.Elt.Figcaption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Figcaption_

figcaption
  :: forall event payload
   . IsEvent event
  => event (Attribute Figcaption_)
  -> Array (Element event payload)
  -> Element event payload
figcaption = elementify "figcaption"

figcaption_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
figcaption_ = figcaption empty
