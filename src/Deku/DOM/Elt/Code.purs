module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Code_

code
  :: forall lock payload
   . Event (Attribute Code_)
  -> Array (Domable lock payload)
  -> Domable lock payload
code attributes kids = Domable (Element' (elementify "code" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

code_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
code_ = code empty

