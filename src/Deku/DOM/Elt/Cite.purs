module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Cite_

cite
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Cite_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
cite attributes kids = Element'
  (elementify "cite" attributes (FixedChildren' (FixedChildren kids)))

cite_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
cite_ = cite empty

