module Deku.DOM.Elt.S where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data S_

s
  :: forall lock payload
   . Event (Attribute S_)
  -> Array (Domable lock payload)
  -> Domable lock payload
s attributes kids = Element' (elementify "s" attributes (FixedChildren' (FixedChildren kids)))

s_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
s_ = s empty

