module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Code_

code
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Code_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
code attributes kids = Element' (elementify "code" attributes (fixed kids))

code_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
code_ = code empty

