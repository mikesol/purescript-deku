module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Col_

col
  :: forall lock payload
   . Event (Attribute Col_)
  -> Array (Domable lock payload)
  -> Domable lock payload
col attributes kids = Domable (Element' (elementify "col" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

col_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
col_ = col empty

