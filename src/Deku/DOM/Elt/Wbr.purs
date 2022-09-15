module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Wbr_

wbr
  :: forall lock payload
   . Event (Attribute Wbr_)
  -> Array (Domable lock payload)
  -> Domable lock payload
wbr attributes kids = Domable (Element' (elementify "wbr" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

wbr_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
wbr_ = wbr empty

