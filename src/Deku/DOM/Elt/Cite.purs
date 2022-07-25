module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Cite_

cite
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Cite_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
cite attributes kids = Element' (elementify "cite" attributes (fixed kids))

cite_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
cite_ = cite empty

