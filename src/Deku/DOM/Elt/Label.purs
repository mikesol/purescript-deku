module Deku.DOM.Elt.Label where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Label_

label
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Label_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
label attributes kids = Element' (elementify "label" attributes (fixed kids))

label_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
label_ = label empty

