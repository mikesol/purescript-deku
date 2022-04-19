module Deku.DOM.Elt.Dd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Dd_

dd
  :: forall event payload
   . IsEvent event
  => event (Attribute Dd_)
  -> Array (Element event payload)
  -> Element event payload
dd = elementify "dd"

dd_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
dd_ = dd empty
