module Deku.DOM.Elt.Xdata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Xdata_

xdata
  :: forall event payload
   . IsEvent event
  => event (Attribute Xdata_)
  -> Array (Element event payload)
  -> Element event payload
xdata = elementify "data"

xdata_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
xdata_ = xdata empty
