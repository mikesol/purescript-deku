module Deku.DOM.Elt.Label where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Label_

label
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Label_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
label attributes kids = Element'
  (elementify "label" attributes (FixedChildren' (FixedChildren kids)))

label_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
label_ = label empty

