module Deku.DOM.Elt.Figure where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Figure_

figure
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Figure_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
figure attributes kids = Element' (elementify "figure" attributes (fixed kids))

figure_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
figure_ = figure empty

