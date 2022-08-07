module Deku.DOM.Elt.Basefont where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Basefont_

basefont
  :: forall lock payload
   . AnEvent M (Attribute Basefont_)
  -> Array (Domable lock payload)
  -> Domable lock payload
basefont attributes kids = Element'
  (elementify "basefont" attributes (fixed kids))

basefont_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
basefont_ = basefont empty

