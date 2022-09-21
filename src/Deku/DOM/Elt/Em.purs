module Deku.DOM.Elt.Em where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Em_

em
  :: forall lock payload
   . Event (Attribute Em_)
  -> Array (Domable lock payload)
  -> Domable lock payload
em attributes kids = Domable (Element' (elementify "em" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

em_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
em_ = em empty

