module Deku.DOM.Elt.Link where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Link_

link
  :: forall event payload
   . IsEvent event
  => event (Attribute Link_)
  -> Array (Element event payload)
  -> Element event payload
link = elementify "link"

link_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
link_ = link empty
