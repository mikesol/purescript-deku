module Deku.DOM.Elt.A where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data A_

a
  :: forall lock payload
   . Event (Attribute A_)
  -> Array (Domable lock payload)
  -> Domable lock payload
a attributes kids = Domable (Element' (elementify "a" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

a_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
a_ = a empty

