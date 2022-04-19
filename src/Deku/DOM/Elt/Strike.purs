module Deku.DOM.Elt.Strike where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Strike_

strike
  :: forall event payload
   . IsEvent event
  => event (Attribute Strike_)
  -> Array (Element event payload)
  -> Element event payload
strike = elementify "strike"

strike_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
strike_ = strike empty
