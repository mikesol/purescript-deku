module Deku.DOM.Elt.Del where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Del_

del
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Del_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
del attributes kids = Element' (elementify "del" attributes (fixed kids))

del_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
del_ = del empty

