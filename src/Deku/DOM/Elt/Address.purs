module Deku.DOM.Elt.Address where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Address_

address
  :: forall lock payload
   . Event (Attribute Address_)
  -> Array (Domable lock payload)
  -> Domable lock payload
address attributes kids = Domable (Element' (elementify "address" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

address_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
address_ = address empty

