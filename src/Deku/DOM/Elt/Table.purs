module Deku.DOM.Elt.Table where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Table_

table
  :: forall lock payload
   . Event (Attribute Table_)
  -> Array (Domable lock payload)
  -> Domable lock payload
table attributes kids = Domable (Element' (elementify "table" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

table_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
table_ = table empty

