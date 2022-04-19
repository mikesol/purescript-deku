module Deku.DOM.Elt.Pre where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Pre_

pre
  :: forall event payload
   . IsEvent event
  => event (Attribute Pre_)
  -> Array (Element event payload)
  -> Element event payload
pre = elementify "pre"

pre_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
pre_ = pre empty
