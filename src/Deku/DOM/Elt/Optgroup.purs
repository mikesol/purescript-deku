module Deku.DOM.Elt.Optgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Optgroup_

optgroup
  :: forall lock payload
   . Event (Attribute Optgroup_)
  -> Array (Domable lock payload)
  -> Domable lock payload
optgroup attributes kids = Domable (Element' (elementify "optgroup" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

optgroup_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
optgroup_ = optgroup empty

