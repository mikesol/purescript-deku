module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Var_

var
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Var_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
var attributes kids = Element' (elementify "var" attributes (fixed kids))

var_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
var_ = var empty

