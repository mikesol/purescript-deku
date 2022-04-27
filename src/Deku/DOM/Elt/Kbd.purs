module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Kbd_

kbd
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Kbd_)
  -> seed
  -> Element lock payload
kbd attributes seed = elementify "kbd" attributes (plant seed)

kbd_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
kbd_ = kbd empty

