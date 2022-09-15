module Deku.DOM.Elt.Samp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Samp_

samp
  :: forall lock payload
   . Event (Attribute Samp_)
  -> Array (Domable lock payload)
  -> Domable lock payload
samp attributes kids = Domable (Element' (elementify "samp" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

samp_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
samp_ = samp empty

