module Deku.DOM.Elt.Nav where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Nav_

nav
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Nav_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
nav attributes kids = Element'
  (elementify "nav" attributes (FixedChildren' (FixedChildren kids)))

nav_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
nav_ = nav empty

