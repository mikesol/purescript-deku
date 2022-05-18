module Deku.DOM.Elt.Fieldset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Fieldset_

fieldset
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Fieldset_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
fieldset attributes kids = Element' (elementify "fieldset" attributes (fixed kids))

fieldset_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
fieldset_ = fieldset empty

