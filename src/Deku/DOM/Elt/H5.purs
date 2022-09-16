module Deku.DOM.Elt.H5 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data H5_

h5
  :: forall lock payload
   . Event (Attribute H5_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h5 attributes kids = Domable (Element' (elementify "h5" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

h5_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h5_ = h5 empty

