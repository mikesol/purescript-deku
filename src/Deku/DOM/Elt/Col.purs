module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Col_

col
  :: forall lock payload
   . Event (Attribute Col_)
  -> Array (Domable lock payload)
  -> Domable lock payload
col attributes kids = Element' (elementify "col" attributes (FixedChildren' (FixedChildren kids)))

col_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
col_ = col empty

