module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Td_

td
  :: forall lock payload
   . Event (Attribute Td_)
  -> Array (Domable lock payload)
  -> Domable lock payload
td attributes kids = Domable (Element' (elementify "td" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

td_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
td_ = td empty

