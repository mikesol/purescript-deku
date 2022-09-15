module Deku.DOM.Elt.Span where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Span_

span
  :: forall lock payload
   . Event (Attribute Span_)
  -> Array (Domable lock payload)
  -> Domable lock payload
span attributes kids = Domable (Element' (elementify "span" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

span_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
span_ = span empty

