module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Main_

main
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Main_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
main attributes kids = Element' (elementify "main" attributes (fixed kids))

main_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
main_ = main empty

