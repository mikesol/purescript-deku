module Deku.DOM.Elt.Tt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Tt_

tt
  :: forall lock payload
   . Event (Attribute Tt_)
  -> Array (Domable lock payload)
  -> Domable lock payload
tt attributes kids = Element' (elementify "tt" attributes (FixedChildren' (FixedChildren kids)))

tt_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
tt_ = tt empty

