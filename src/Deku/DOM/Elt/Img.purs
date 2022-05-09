module Deku.DOM.Elt.Img where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Img_

img
  :: forall lock payload
   . Event (Attribute Img_)
  -> Array (Domable lock payload)
  -> Domable lock payload
img attributes kids = Element' (elementify "img" attributes (FixedChildren' (FixedChildren kids)))

img_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
img_ = img empty

