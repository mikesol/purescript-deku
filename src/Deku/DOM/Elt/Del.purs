module Deku.DOM.Elt.Del where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Del_

del
  :: forall event payload
   . IsEvent event
  => event (Attribute Del_)
  -> Array (Element event payload)
  -> Element event payload
del = elementify "del"

del_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
del_ = del empty
