module Deku.DOM.Elt.Form where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Form_

form
  :: forall lock payload
   . Event (Attribute Form_)
  -> Array (Domable lock payload)
  -> Domable lock payload
form attributes kids = Domable (Element' (elementify "form" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

form_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
form_ = form empty

