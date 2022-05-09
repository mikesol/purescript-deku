module Deku.DOM.Elt.H1 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data H1_

h1
  :: forall lock payload
   . Event (Attribute H1_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h1 attributes kids = Element' (elementify "h1" attributes (FixedChildren' (FixedChildren kids)))

h1_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h1_ = h1 empty

