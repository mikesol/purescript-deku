module Deku.DOM.Elt.Li where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Li_

li
  :: forall lock payload
   . Event (Attribute Li_)
  -> Array (Domable lock payload)
  -> Domable lock payload
li attributes kids = Domable (Element' (elementify "li" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

li_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
li_ = li empty

