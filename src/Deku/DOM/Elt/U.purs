module Deku.DOM.Elt.U where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data U_

u
  :: forall lock payload
   . Event (Attribute U_)
  -> Array (Domable lock payload)
  -> Domable lock payload
u attributes kids = Element' (elementify "u" attributes (FixedChildren' (FixedChildren kids)))

u_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
u_ = u empty

