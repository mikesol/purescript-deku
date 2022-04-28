module Deku.DOM.Elt.I where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data I_

i
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute I_)
  -> seed
  -> Element lock payload
i attributes seed = elementify "i" attributes (plant seed)

i_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
i_ = i empty

