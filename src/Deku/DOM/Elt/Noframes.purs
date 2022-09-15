module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Noframes_

noframes
  :: forall lock payload
   . Event (Attribute Noframes_)
  -> Array (Domable lock payload)
  -> Domable lock payload
noframes attributes kids = Domable (Element' (elementify "noframes" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

noframes_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
noframes_ = noframes empty

