module Deku.DOM.Elt.Del where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Del_

del
  :: forall lock payload
   . Event (Attribute Del_)
  -> Array (Domable lock payload)
  -> Domable lock payload
del attributes kids = Domable (Element' (elementify "del" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

del_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
del_ = del empty

