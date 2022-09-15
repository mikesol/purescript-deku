module Deku.DOM.Elt.Section where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Section_

section
  :: forall lock payload
   . Event (Attribute Section_)
  -> Array (Domable lock payload)
  -> Domable lock payload
section attributes kids = Domable (Element' (elementify "section" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

section_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
section_ = section empty

