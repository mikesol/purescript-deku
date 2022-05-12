module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Var_

var
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Var_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
var attributes kids = Element' (elementify "var" attributes (fixed kids))

var_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
var_ = var empty

