module Deku.DOM.Elt.Dd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Dd_

dd
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Dd_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
dd attributes kids = Element' (elementify "dd" attributes (fixed kids))

dd_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
dd_ = dd empty

