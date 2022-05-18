module Deku.DOM.Elt.Script where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Script_

script
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Script_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
script attributes kids = Element' (elementify "script" attributes (fixed kids))

script_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
script_ = script empty

