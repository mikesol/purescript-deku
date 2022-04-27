module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Main_

main
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Main_)
  -> seed
  -> Element lock payload
main attributes seed = elementify "main" attributes (plant seed)

main_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
main_ = main empty

