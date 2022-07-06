module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Div_

div
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Div_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
div attributes kids = Element' (elementify "div" attributes (fixed kids))

div_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
div_ = div empty

