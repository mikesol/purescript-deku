module Deku.DOM.Elt.Embed where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Embed_

embed
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Embed_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
embed attributes kids = Element' (elementify "embed" attributes (fixed kids))

embed_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
embed_ = embed empty

