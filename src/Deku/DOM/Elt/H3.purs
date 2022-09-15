module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data H3_

h3
  :: forall lock payload
   . Event (Attribute H3_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h3 attributes kids = Domable (Element' (elementify "h3" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

h3_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h3_ = h3 empty

