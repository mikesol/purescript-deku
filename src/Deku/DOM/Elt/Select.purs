module Deku.DOM.Elt.Select where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Select_

select
  :: forall lock payload
   . Event (Attribute Select_)
  -> Array (Domable lock payload)
  -> Domable lock payload
select attributes kids = Domable (Element' (elementify "select" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

select_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
select_ = select empty

