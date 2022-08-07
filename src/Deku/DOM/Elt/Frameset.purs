module Deku.DOM.Elt.Frameset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Frameset_

frameset
  :: forall lock payload
   . AnEvent M (Attribute Frameset_)
  -> Array (Domable lock payload)
  -> Domable lock payload
frameset attributes kids = Element'
  (elementify "frameset" attributes (fixed kids))

frameset_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
frameset_ = frameset empty

