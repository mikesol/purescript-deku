module Deku.DOM.Elt.Img where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Img_

img
  :: forall lock payload
   . Event (Attribute Img_)
  -> Array (Domable lock payload)
  -> Domable lock payload
img attributes kids = Domable (Element' (elementify "img" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

img_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
img_ = img empty

