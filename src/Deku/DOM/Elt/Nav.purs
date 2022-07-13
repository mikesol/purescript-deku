module Deku.DOM.Elt.Nav where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Nav_

nav
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Nav_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
nav attributes kids = Element' (elementify "nav" attributes (fixed kids))

nav_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
nav_ = nav empty

