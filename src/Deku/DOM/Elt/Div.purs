module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Div_

div
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Div_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
div attributes kids = Element' (elementify "div" attributes (fixed kids))

div_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
div_ = div empty

