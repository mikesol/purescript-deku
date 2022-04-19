module Deku.DOM.Elt.Rt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Rt_

rt
  :: forall event payload
   . IsEvent event
  => event (Attribute Rt_)
  -> Array (Element event payload)
  -> Element event payload
rt = elementify "rt"

rt_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
rt_ = rt empty
