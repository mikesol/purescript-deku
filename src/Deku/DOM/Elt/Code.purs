module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Code_

code
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Code_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
code attributes kids = Element' (elementify "code" attributes (fixed kids))

code_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
code_ = code empty

