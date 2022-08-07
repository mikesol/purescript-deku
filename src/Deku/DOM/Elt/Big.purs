module Deku.DOM.Elt.Big where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Big_

big
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Big_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
big attributes kids = Element' (elementify "big" attributes (fixed kids))

big_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
big_ = big empty

