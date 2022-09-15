module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Br_

br
  :: forall lock payload
   . Event (Attribute Br_)
  -> Array (Domable lock payload)
  -> Domable lock payload
br attributes kids = Domable (Element' (elementify "br" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

br_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
br_ = br empty

