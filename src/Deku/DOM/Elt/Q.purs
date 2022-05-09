module Deku.DOM.Elt.Q where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Q_

q
  :: forall lock payload
   . Event (Attribute Q_)
  -> Array (Domable lock payload)
  -> Domable lock payload
q attributes kids = Element' (elementify "q" attributes (FixedChildren' (FixedChildren kids)))

q_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
q_ = q empty

