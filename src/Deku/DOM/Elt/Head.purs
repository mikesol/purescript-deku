module Deku.DOM.Elt.Head where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Head_

head
  :: forall lock payload
   . Event (Attribute Head_)
  -> Array (Domable lock payload)
  -> Domable lock payload
head attributes kids = Element' (elementify "head" attributes (FixedChildren' (FixedChildren kids)))

head_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
head_ = head empty

