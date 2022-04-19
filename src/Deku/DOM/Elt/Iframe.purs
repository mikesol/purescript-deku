module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Iframe_

iframe
  :: forall event payload
   . IsEvent event
  => event (Attribute Iframe_)
  -> Array (Element event payload)
  -> Element event payload
iframe = elementify "iframe"

iframe_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
iframe_ = iframe empty
