module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Noframes_

noframes
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Noframes_)
  -> seed
  -> Element lock payload
noframes attributes seed = elementify "noframes" attributes (plant seed)

noframes_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
noframes_ = noframes empty

