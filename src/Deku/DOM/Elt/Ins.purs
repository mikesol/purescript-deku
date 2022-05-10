module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Ins_

ins
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Ins_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
ins attributes kids = Element'
  (elementify "ins" attributes (FixedChildren' (FixedChildren kids)))

ins_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
ins_ = ins empty

