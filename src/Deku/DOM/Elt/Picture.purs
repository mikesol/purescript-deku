module Deku.DOM.Elt.Picture where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Picture_

picture
  :: forall lock payload
   . Event (Attribute Picture_)
  -> Array (Domable lock payload)
  -> Domable lock payload
picture attributes kids = Domable (Element' (elementify "picture" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

picture_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
picture_ = picture empty

