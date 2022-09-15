module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Body_

body
  :: forall lock payload
   . Event (Attribute Body_)
  -> Array (Domable lock payload)
  -> Domable lock payload
body attributes kids = Domable (Element' (elementify "body" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

body_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
body_ = body empty

