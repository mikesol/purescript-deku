module Deku.DOM.Elt.Link where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Link_

link
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Link_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
link attributes kids = Element' (elementify "link" attributes (fixed kids))

link_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
link_ = link empty

