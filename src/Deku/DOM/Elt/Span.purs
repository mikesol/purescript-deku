module Deku.DOM.Elt.Span where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Span_

span
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Span_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
span attributes kids = Element' (elementify "span" attributes (fixed kids))

span_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
span_ = span empty

