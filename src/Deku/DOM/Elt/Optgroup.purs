module Deku.DOM.Elt.Optgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Optgroup_

optgroup
  :: forall lock payload
   . Event (Attribute Optgroup_)
  -> Array (Domable lock payload)
  -> Domable lock payload
optgroup attributes kids = Element' (elementify "optgroup" attributes (FixedChildren' (FixedChildren kids)))

optgroup_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
optgroup_ = optgroup empty

