module Deku.DOM.Elt.Li where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Li_

li
  :: forall event payload
   . IsEvent event
  => event (Attribute Li_)
  -> Array (Element event payload)
  -> Element event payload
li = elementify "li"

li_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
li_ = li empty
