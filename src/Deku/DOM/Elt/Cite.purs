module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Cite_

cite
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Cite_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
cite attributes kids = Element' (elementify "cite" attributes (fixed kids))

cite_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
cite_ = cite empty

