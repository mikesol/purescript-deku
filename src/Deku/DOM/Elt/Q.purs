module Deku.DOM.Elt.Q where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Q_

q
  :: forall lock payload
   . Event (Attribute Q_)
  -> Array (Domable lock payload)
  -> Domable lock payload
q attributes kids = Domable (Element' (elementify "q" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

q_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
q_ = q empty

