module Deku.DOM.Elt.Img where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Img_

img
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Img_)
  -> seed
  -> Element lock payload
img attributes seed = elementify "img" attributes (plant seed)

img_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
img_ = img empty

