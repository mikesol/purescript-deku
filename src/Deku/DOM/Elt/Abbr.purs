module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Abbr_

abbr
  :: forall lock payload
   . Event (Attribute Abbr_)
  -> Array (Domable lock payload)
  -> Domable lock payload
abbr attributes kids = Domable (Element' (elementify "abbr" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

abbr_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
abbr_ = abbr empty

