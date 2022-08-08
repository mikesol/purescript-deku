module Deku.DOM.Elt.Option where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Option_

option
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Option_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
option attributes kids = Element' (elementify "option" attributes (fixed kids))

option_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
option_ = option empty

