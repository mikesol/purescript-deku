module Deku.DOM.Elt.Small where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Small_

small
  :: forall lock payload
   . Event (Attribute Small_)
  -> Array (Domable lock payload)
  -> Domable lock payload
small attributes kids = Element' (elementify "small" attributes (FixedChildren' (FixedChildren kids)))

small_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
small_ = small empty

