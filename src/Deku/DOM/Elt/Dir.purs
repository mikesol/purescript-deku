module Deku.DOM.Elt.Dir where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Dir_

dir
  :: forall event payload
   . IsEvent event
  => event (Attribute Dir_)
  -> Array (Element event payload)
  -> Element event payload
dir = elementify "dir"

dir_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
dir_ = dir empty
