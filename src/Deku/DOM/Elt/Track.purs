module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Track_

track
  :: forall lock payload
   . Event (Attribute Track_)
  -> Array (Domable lock payload)
  -> Domable lock payload
track attributes kids = Element' (elementify "track" attributes (FixedChildren' (FixedChildren kids)))

track_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
track_ = track empty

