module Deku.DOM.Elt.Link where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Link_

link
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Link_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
link attributes kids = Element' (elementify "link" attributes (fixed kids))

link_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
link_ = link empty

