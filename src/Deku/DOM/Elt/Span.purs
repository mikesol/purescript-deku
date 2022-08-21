module Deku.DOM.Elt.Span where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Span_

span
  :: forall lock payload
   . AnEvent Zora (Attribute Span_)
  -> Array (Domable lock payload)
  -> Domable lock payload
span attributes kids = Element' (elementify "span" attributes (fixed kids))

span_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
span_ = span empty

