module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Input_

input
  :: forall lock payload
   . Event (Attribute Input_)
  -> Array (Domable lock payload)
  -> Domable lock payload
input attributes kids = Domable (Element' (elementify "input" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

input_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
input_ = input empty

