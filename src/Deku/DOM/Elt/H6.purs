module Deku.DOM.Elt.H6 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data H6_

h6
  :: forall lock payload
   . Event (Attribute H6_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h6 attributes kids = Domable (Element' (elementify "h6" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

h6_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h6_ = h6 empty

