module Deku.DOM.Elt.Basefont where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Basefont_

basefont
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Basefont_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
basefont attributes kids = Element' (elementify "basefont" attributes (fixed kids))

basefont_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
basefont_ = basefont empty

