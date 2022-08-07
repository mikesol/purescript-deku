module Deku.DOM.Elt.Footer where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Footer_

footer
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Footer_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
footer attributes kids = Element' (elementify "footer" attributes (fixed kids))

footer_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
footer_ = footer empty

