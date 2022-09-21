module Deku.DOM.Elt.Tfoot where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Tfoot_

tfoot
  :: forall lock payload
   . Event (Attribute Tfoot_)
  -> Array (Domable lock payload)
  -> Domable lock payload
tfoot attributes kids = Domable (Element' (elementify "tfoot" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

tfoot_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
tfoot_ = tfoot empty

