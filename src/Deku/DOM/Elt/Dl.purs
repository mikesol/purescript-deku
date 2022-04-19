module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Dl_

dl
  :: forall event payload
   . IsEvent event
  => event (Attribute Dl_)
  -> Array (Element event payload)
  -> Element event payload
dl = elementify "dl"

dl_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
dl_ = dl empty
