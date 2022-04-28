module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Col_

col
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Col_)
  -> seed
  -> Element lock payload
col attributes seed = elementify "col" attributes (plant seed)

col_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
col_ = col empty

