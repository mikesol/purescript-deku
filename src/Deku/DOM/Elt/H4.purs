module Deku.DOM.Elt.H4 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data H4_

h4
  :: forall lock payload
   . Event (Attribute H4_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h4 attributes kids = Domable (Element' (elementify "h4" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

h4_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h4_ = h4 empty

