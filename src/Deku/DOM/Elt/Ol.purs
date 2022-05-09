module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Ol_

ol
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Ol_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
ol attributes kids = Element' (elementify "ol" attributes (FixedChildren' (FixedChildren kids)))

ol_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
ol_ = ol empty

