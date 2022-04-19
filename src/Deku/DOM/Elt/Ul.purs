module Deku.DOM.Elt.Ul where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Ul_

ul
  :: forall event payload
   . IsEvent event
  => event (Attribute Ul_)
  -> Array (Element event payload)
  -> Element event payload
ul = elementify "ul"

ul_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
ul_ = ul empty
