module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Details_

details
  :: forall lock payload
   . Event (Attribute Details_)
  -> Array (Domable lock payload)
  -> Domable lock payload
details attributes kids = Domable (Element' (elementify "details" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

details_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
details_ = details empty

