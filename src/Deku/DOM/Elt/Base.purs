module Deku.DOM.Elt.Base where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Base_

base
  :: forall event payload
   . IsEvent event
  => event (Attribute Base_)
  -> Array (Element event payload)
  -> Element event payload
base = elementify "base"

base_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
base_ = base empty
