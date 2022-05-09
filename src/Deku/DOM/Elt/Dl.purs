module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Dl_

dl
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Dl_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
dl attributes kids = Element' (elementify "dl" attributes (FixedChildren' (FixedChildren kids)))

dl_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
dl_ = dl empty

