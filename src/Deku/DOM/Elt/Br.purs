module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Br_

br
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Br_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
br attributes kids = Element' (elementify "br" attributes (FixedChildren' (FixedChildren kids)))

br_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
br_ = br empty

