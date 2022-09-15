module Deku.DOM.Elt.Dd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Dd_

dd
  :: forall lock payload
   . Event (Attribute Dd_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dd attributes kids = Domable (Element' (elementify "dd" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

dd_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dd_ = dd empty

