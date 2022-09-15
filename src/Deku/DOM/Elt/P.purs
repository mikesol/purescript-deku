module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data P_

p
  :: forall lock payload
   . Event (Attribute P_)
  -> Array (Domable lock payload)
  -> Domable lock payload
p attributes kids = Domable (Element' (elementify "p" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

p_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
p_ = p empty

