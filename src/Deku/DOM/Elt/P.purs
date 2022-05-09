module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data P_

p
  :: forall lock payload
   . Event (Attribute P_)
  -> Array (Domable lock payload)
  -> Domable lock payload
p attributes kids = Element' (elementify "p" attributes (FixedChildren' (FixedChildren kids)))

p_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
p_ = p empty

