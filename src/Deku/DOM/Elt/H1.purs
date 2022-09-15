module Deku.DOM.Elt.H1 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data H1_

h1
  :: forall lock payload
   . Event (Attribute H1_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h1 attributes kids = Domable (Element' (elementify "h1" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

h1_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h1_ = h1 empty

