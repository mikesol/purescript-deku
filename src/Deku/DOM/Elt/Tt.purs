module Deku.DOM.Elt.Tt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Tt_

tt
  :: forall lock payload
   . Event (Attribute Tt_)
  -> Array (Domable lock payload)
  -> Domable lock payload
tt attributes kids = Domable (Element' (elementify "tt" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

tt_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
tt_ = tt empty

