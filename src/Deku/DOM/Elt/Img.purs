module Deku.DOM.Elt.Img where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Img_

img
  :: forall lock payload
   . AnEvent M (Attribute Img_)
  -> Array (Domable lock payload)
  -> Domable lock payload
img attributes kids = Element' (elementify "img" attributes (fixed kids))

img_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
img_ = img empty

