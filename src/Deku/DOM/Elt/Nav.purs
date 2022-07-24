module Deku.DOM.Elt.Nav where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Nav_

nav
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Nav_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
nav attributes kids = Element' (elementify "nav" attributes (fixed kids))

nav_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
nav_ = nav empty

