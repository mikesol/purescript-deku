module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Big_

big
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Big_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
big attributes kids = Element' (elementify "big" attributes (fixed kids))

big_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
big_ = big empty

