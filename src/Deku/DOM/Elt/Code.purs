module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Code_

code
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Code_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
code attributes kids = Element'
  (elementify "code" attributes (FixedChildren' (FixedChildren kids)))

code_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
code_ = code empty

