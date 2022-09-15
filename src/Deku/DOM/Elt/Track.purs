module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Track_

track
  :: forall lock payload
   . Event (Attribute Track_)
  -> Array (Domable lock payload)
  -> Domable lock payload
track attributes kids = Domable (Element' (elementify "track" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

track_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
track_ = track empty

