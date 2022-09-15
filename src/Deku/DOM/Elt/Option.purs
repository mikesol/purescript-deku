module Deku.DOM.Elt.Option where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Option_

option
  :: forall lock payload
   . Event (Attribute Option_)
  -> Array (Domable lock payload)
  -> Domable lock payload
option attributes kids = Domable (Element' (elementify "option" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

option_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
option_ = option empty

