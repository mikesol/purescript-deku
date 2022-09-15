module Deku.DOM.Elt.Label where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Label_

label
  :: forall lock payload
   . Event (Attribute Label_)
  -> Array (Domable lock payload)
  -> Domable lock payload
label attributes kids = Domable (Element' (elementify "label" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

label_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
label_ = label empty

