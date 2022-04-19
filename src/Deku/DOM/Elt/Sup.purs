module Deku.DOM.Elt.Sup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Sup_

sup
  :: forall event payload
   . IsEvent event
  => event (Attribute Sup_)
  -> Array (Element event payload)
  -> Element event payload
sup = elementify "sup"

sup_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
sup_ = sup empty
