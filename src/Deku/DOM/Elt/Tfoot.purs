module Deku.DOM.Elt.Tfoot where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Tfoot_

tfoot
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Tfoot_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
tfoot attributes kids = Element' (elementify "tfoot" attributes (fixed kids))

tfoot_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
tfoot_ = tfoot empty

