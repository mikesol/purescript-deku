module Deku.DOM.Elt.Optgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Optgroup_

optgroup
  :: forall event payload
   . IsEvent event
  => event (Attribute Optgroup_)
  -> Array (Element event payload)
  -> Element event payload
optgroup = elementify "optgroup"

optgroup_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
optgroup_ = optgroup empty
