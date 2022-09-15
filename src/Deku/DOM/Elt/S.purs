module Deku.DOM.Elt.S where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data S_

s
  :: forall lock payload
   . Event (Attribute S_)
  -> Array (Domable lock payload)
  -> Domable lock payload
s attributes kids = Domable (Element' (elementify "s" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

s_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
s_ = s empty

