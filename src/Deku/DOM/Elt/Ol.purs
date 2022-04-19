module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Ol_

ol
  :: forall event payload
   . IsEvent event
  => event (Attribute Ol_)
  -> Array (Element event payload)
  -> Element event payload
ol = elementify "ol"

ol_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
ol_ = ol empty
