module Deku.DOM.Elt.Summary where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Summary_

summary
  :: forall lock payload
   . Event (Attribute Summary_)
  -> Array (Domable lock payload)
  -> Domable lock payload
summary attributes kids = Domable (Element' (elementify "summary" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

summary_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
summary_ = summary empty

