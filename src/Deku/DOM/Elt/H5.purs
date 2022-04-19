module Deku.DOM.Elt.H5 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data H5_

h5
  :: forall event payload
   . IsEvent event
  => event (Attribute H5_)
  -> Array (Element event payload)
  -> Element event payload
h5 = elementify "h5"

h5_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
h5_ = h5 empty
