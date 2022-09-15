module Deku.DOM.Elt.B where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data B_

b
  :: forall lock payload
   . Event (Attribute B_)
  -> Array (Domable lock payload)
  -> Domable lock payload
b attributes kids = Domable (Element' (elementify "b" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

b_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
b_ = b empty

