module Deku.DOM.Elt.Noscript where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Noscript_

noscript
  :: forall event payload
   . IsEvent event
  => event (Attribute Noscript_)
  -> Array (Element event payload)
  -> Element event payload
noscript = elementify "noscript"

noscript_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
noscript_ = noscript empty
