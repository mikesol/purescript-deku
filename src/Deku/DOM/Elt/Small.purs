module Deku.DOM.Elt.Small where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Small_

small
  :: forall lock payload
   . Event (Attribute Small_)
  -> Array (Domable lock payload)
  -> Domable lock payload
small attributes kids = Domable (Element' (elementify "small" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

small_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
small_ = small empty

