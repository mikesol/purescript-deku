module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Main_

main
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Main_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
main attributes kids = Element' (elementify "main" attributes (fixed kids))

main_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
main_ = main empty

