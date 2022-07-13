module Deku.DOM.Elt.Strike where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Strike_

strike
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Strike_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
strike attributes kids = Element' (elementify "strike" attributes (fixed kids))

strike_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
strike_ = strike empty

