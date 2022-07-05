module Deku.DOM.Elt.Script where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Script_

script
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Script_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
script attributes kids = Element' (elementify "script" attributes (fixed kids))

script_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
script_ = script empty

