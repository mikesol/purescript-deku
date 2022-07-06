module Deku.DOM.Elt.Del where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Del_

del
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Del_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
del attributes kids = Element' (elementify "del" attributes (fixed kids))

del_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
del_ = del empty

