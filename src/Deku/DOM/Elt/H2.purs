module Deku.DOM.Elt.H2 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data H2_

h2
  :: forall lock payload
   . Event (Attribute H2_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h2 attributes kids = Domable (Element' (elementify "h2" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

h2_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h2_ = h2 empty

