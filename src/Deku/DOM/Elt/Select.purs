module Deku.DOM.Elt.Select where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Select_

select
  :: forall event payload
   . IsEvent event
  => event (Attribute Select_)
  -> Array (Element event payload)
  -> Element event payload
select = elementify "select"

select_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
select_ = select empty
