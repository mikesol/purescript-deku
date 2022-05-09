module Deku.DOM.Elt.B where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data B_

b
  :: forall lock payload
   . Event (Attribute B_)
  -> Array (Domable lock payload)
  -> Domable lock payload
b attributes kids = Element' (elementify "b" attributes (FixedChildren' (FixedChildren kids)))

b_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
b_ = b empty

