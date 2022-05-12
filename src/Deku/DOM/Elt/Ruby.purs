module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Ruby_

ruby
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Ruby_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
ruby attributes kids = Element' (elementify "ruby" attributes (fixed kids))

ruby_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
ruby_ = ruby empty

