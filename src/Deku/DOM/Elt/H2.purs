module Deku.DOM.Elt.H2 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data H2_

h2
  :: forall lock payload
   . Event (Attribute H2_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h2 attributes kids = Element' (elementify "h2" attributes (FixedChildren' (FixedChildren kids)))

h2_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h2_ = h2 empty

