module Deku.DOM.Elt.Form where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Form_

form
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Form_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
form attributes kids = Element' (elementify "form" attributes (fixed kids))

form_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
form_ = form empty

