module Deku.DOM.Elt.Ul where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Ul_

ul
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Ul_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
ul attributes kids = Element' (elementify "ul" attributes (FixedChildren' (FixedChildren kids)))

ul_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
ul_ = ul empty

