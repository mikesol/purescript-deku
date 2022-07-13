module Deku.DOM.Elt.Span where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Span_

span
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Span_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
span attributes kids = Element' (elementify "span" attributes (fixed kids))

span_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
span_ = span empty

