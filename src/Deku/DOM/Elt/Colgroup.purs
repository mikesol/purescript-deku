module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Colgroup_

colgroup
  :: forall event payload
   . IsEvent event
  => event (Attribute Colgroup_)
  -> Array (Element event payload)
  -> Element event payload
colgroup = elementify "colgroup"

colgroup_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
colgroup_ = colgroup empty
