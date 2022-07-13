module Deku.DOM.Elt.Ul where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Ul_

ul
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Ul_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
ul attributes kids = Element' (elementify "ul" attributes (fixed kids))

ul_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
ul_ = ul empty

