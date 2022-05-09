module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Td_

td
  :: forall lock payload
   . Event (Attribute Td_)
  -> Array (Domable lock payload)
  -> Domable lock payload
td attributes kids = Element' (elementify "td" attributes (FixedChildren' (FixedChildren kids)))

td_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
td_ = td empty

