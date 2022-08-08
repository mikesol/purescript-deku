module Deku.DOM.Elt.Legend where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Legend_

legend
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Legend_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
legend attributes kids = Element' (elementify "legend" attributes (fixed kids))

legend_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
legend_ = legend empty

