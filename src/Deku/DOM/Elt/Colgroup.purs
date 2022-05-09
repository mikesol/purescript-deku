module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Colgroup_

colgroup
  :: forall lock payload
   . Event (Attribute Colgroup_)
  -> Array (Domable lock payload)
  -> Domable lock payload
colgroup attributes kids = Element' (elementify "colgroup" attributes (FixedChildren' (FixedChildren kids)))

colgroup_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
colgroup_ = colgroup empty

