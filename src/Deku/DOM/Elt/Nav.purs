module Deku.DOM.Elt.Nav where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Nav_

nav
  :: forall lock payload
   . Event (Attribute Nav_)
  -> Array (Domable lock payload)
  -> Domable lock payload
nav attributes kids = Domable (Element' (elementify "nav" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

nav_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
nav_ = nav empty

