module Deku.DOM.Elt.Aside where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Aside_

aside
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Aside_)
  -> seed
  -> Element lock payload
aside attributes seed = elementify "aside" attributes (plant seed)

aside_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
aside_ = aside empty

