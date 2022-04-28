module Deku.DOM.Elt.Option where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Option_

option
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Option_)
  -> seed
  -> Element lock payload
option attributes seed = elementify "option" attributes (plant seed)

option_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
option_ = option empty

