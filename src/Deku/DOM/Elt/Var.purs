module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Var_

var
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Var_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
var attributes kids = Element' (elementify "var" attributes (fixed kids))

var_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
var_ = var empty

