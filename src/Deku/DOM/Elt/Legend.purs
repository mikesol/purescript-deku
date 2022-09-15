module Deku.DOM.Elt.Legend where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Legend_

legend
  :: forall lock payload
   . Event (Attribute Legend_)
  -> Array (Domable lock payload)
  -> Domable lock payload
legend attributes kids = Domable (Element' (elementify "legend" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

legend_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
legend_ = legend empty

