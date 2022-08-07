module Deku.DOM.Elt.Fieldset where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Fieldset_

fieldset
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Fieldset_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
fieldset attributes kids = Element' (elementify "fieldset" attributes (fixed kids))

fieldset_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
fieldset_ = fieldset empty

