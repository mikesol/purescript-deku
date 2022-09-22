module Deku.DOM.Elt.Hr where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Hr_

hr
  :: forall lock payload
   . Event (Attribute Hr_)
  -> Array (Domable lock payload)
  -> Domable lock payload
hr attributes kids = Domable (Element' (elementify "hr" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

hr_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
hr_ = hr empty

