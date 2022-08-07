module Deku.DOM.Elt.Span where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Span_

span
  :: forall lock payload
   . AnEvent M (Attribute Span_)
  -> Array (Domable lock payload)
  -> Domable lock payload
span attributes kids = Element' (elementify "span" attributes (fixed kids))

span_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
span_ = span empty

