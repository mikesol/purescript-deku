module Deku.DOM.Elt.Fieldset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Fieldset_

fieldset
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Fieldset_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
fieldset attributes kids = Element' (elementify "fieldset" attributes (fixed kids))

fieldset_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
fieldset_ = fieldset empty

