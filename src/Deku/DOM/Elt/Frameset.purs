module Deku.DOM.Elt.Frameset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Frameset_

frameset
  :: forall event payload
   . IsEvent event
  => event (Attribute Frameset_)
  -> Array (Element event payload)
  -> Element event payload
frameset = elementify "frameset"

frameset_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
frameset_ = frameset empty
