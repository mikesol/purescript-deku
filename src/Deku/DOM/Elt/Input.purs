module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Input_

input
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Input_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
input attributes kids = Element' (elementify "input" attributes (fixed kids))

input_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
input_ = input empty

