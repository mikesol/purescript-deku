module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Wbr_

wbr
  :: forall event payload
   . IsEvent event
  => event (Attribute Wbr_)
  -> Array (Element event payload)
  -> Element event payload
wbr = elementify "wbr"

wbr_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
wbr_ = wbr empty
