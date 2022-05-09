module Deku.DOM.Elt.Th where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Th_

th
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Th_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
th attributes kids = Element' (elementify "th" attributes (FixedChildren' (FixedChildren kids)))

th_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
th_ = th empty

