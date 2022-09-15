module Deku.DOM.Elt.Tr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Tr_

tr
  :: forall lock payload
   . Event (Attribute Tr_)
  -> Array (Domable lock payload)
  -> Domable lock payload
tr attributes kids = Domable (Element' (elementify "tr" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

tr_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
tr_ = tr empty

