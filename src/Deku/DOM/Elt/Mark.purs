module Deku.DOM.Elt.Mark where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Mark_

mark
  :: forall lock payload
   . Event (Attribute Mark_)
  -> Array (Domable lock payload)
  -> Domable lock payload
mark attributes kids = Domable (Element' (elementify "mark" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

mark_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
mark_ = mark empty

