module Deku.DOM.Elt.Em where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Em_

em
  :: forall lock payload
   . Event (Attribute Em_)
  -> Array (Domable lock payload)
  -> Domable lock payload
em attributes kids = Element' (elementify "em" attributes (FixedChildren' (FixedChildren kids)))

em_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
em_ = em empty

