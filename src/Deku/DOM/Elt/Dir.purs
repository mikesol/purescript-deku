module Deku.DOM.Elt.Dir where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Dir_

dir
  :: forall lock payload
   . Event (Attribute Dir_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dir attributes kids = Domable (Element' (elementify "dir" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

dir_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dir_ = dir empty

