module Deku.DOM.Elt.Samp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Samp_

samp
  :: forall event payload
   . IsEvent event
  => event (Attribute Samp_)
  -> Array (Element event payload)
  -> Element event payload
samp = elementify "samp"

samp_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
samp_ = samp empty
