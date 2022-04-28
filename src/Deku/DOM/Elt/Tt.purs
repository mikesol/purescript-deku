module Deku.DOM.Elt.Tt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Tt_

tt
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Tt_)
  -> seed
  -> Element lock payload
tt attributes seed = elementify "tt" attributes (plant seed)

tt_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
tt_ = tt empty

