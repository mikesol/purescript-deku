module Deku.DOM.Elt.Basefont where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Basefont_

basefont
  :: forall lock payload
   . Event (Attribute Basefont_)
  -> Array (Domable lock payload)
  -> Domable lock payload
basefont attributes kids = Domable (Element' (elementify "basefont" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

basefont_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
basefont_ = basefont empty

