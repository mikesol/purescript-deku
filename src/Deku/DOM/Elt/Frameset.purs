module Deku.DOM.Elt.Frameset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Frameset_

frameset
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Frameset_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
frameset attributes kids = Element' (elementify "frameset" attributes (fixed kids))

frameset_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
frameset_ = frameset empty

