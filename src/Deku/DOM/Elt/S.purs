module Deku.DOM.Elt.S where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data S_

s
  :: forall event payload
   . IsEvent event
  => event (Attribute S_)
  -> Array (Element event payload)
  -> Element event payload
s = elementify "s"

s_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
s_ = s empty
