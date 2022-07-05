module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Wbr_

wbr
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Wbr_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
wbr attributes kids = Element' (elementify "wbr" attributes (fixed kids))

wbr_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
wbr_ = wbr empty

