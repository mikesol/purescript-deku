module Deku.DOM.Elt.Button where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Button_

button
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Button_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
button attributes kids = Element' (elementify "button" attributes (FixedChildren' (FixedChildren kids)))

button_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
button_ = button empty

