module Deku.DOM.Elt.Th where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Th_

th
  :: forall lock payload
   . Event (Attribute Th_)
  -> Array (Domable lock payload)
  -> Domable lock payload
th attributes kids = Element' (elementify "th" attributes (FixedChildren' (FixedChildren kids)))

th_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
th_ = th empty

