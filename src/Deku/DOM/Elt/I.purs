module Deku.DOM.Elt.I where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data I_

i
  :: forall event payload
   . IsEvent event
  => event (Attribute I_)
  -> Array (Element event payload)
  -> Element event payload
i = elementify "i"

i_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
i_ = i empty
