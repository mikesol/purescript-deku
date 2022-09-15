module Deku.DOM.Elt.Script where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Script_

script
  :: forall lock payload
   . Event (Attribute Script_)
  -> Array (Domable lock payload)
  -> Domable lock payload
script attributes kids = Domable (Element' (elementify "script" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

script_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
script_ = script empty

