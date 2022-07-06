module Deku.DOM.Elt.Noscript where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Noscript_

noscript
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Noscript_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
noscript attributes kids = Element' (elementify "noscript" attributes (fixed kids))

noscript_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
noscript_ = noscript empty

