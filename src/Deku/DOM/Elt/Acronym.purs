module Deku.DOM.Elt.Acronym where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Acronym_

acronym
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Acronym_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
acronym attributes kids = Element' (elementify "acronym" attributes (fixed kids))

acronym_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
acronym_ = acronym empty

