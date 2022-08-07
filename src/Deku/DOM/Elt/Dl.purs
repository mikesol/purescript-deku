module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Dl_

dl
  :: forall lock payload
   . AnEvent M (Attribute Dl_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dl attributes kids = Element' (elementify "dl" attributes (fixed kids))

dl_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dl_ = dl empty

