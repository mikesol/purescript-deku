module Deku.DOM.Elt.Tt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Tt_

tt
  :: forall event payload
   . IsEvent event
  => event (Attribute Tt_)
  -> Array (Element event payload)
  -> Element event payload
tt = elementify "tt"

tt_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
tt_ = tt empty
