module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Big_

big
  :: forall lock payload
   . Event (Attribute Big_)
  -> Array (Domable lock payload)
  -> Domable lock payload
big attributes kids = Domable (Element' (elementify "big" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

big_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
big_ = big empty

