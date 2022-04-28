module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Track_

track
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Track_)
  -> seed
  -> Element lock payload
track attributes seed = elementify "track" attributes (plant seed)

track_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
track_ = track empty

