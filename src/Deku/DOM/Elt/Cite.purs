module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Cite_

cite
  :: forall event payload
   . IsEvent event
  => event (Attribute Cite_)
  -> Array (Element event payload)
  -> Element event payload
cite = elementify "cite"

cite_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
cite_ = cite empty
