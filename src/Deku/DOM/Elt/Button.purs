module Deku.DOM.Elt.Button where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Button_

button
  :: forall lock payload
   . Event (Attribute Button_)
  -> Array (Domable lock payload)
  -> Domable lock payload
button attributes kids = Domable (Element' (elementify "button" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

button_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
button_ = button empty

