module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Big_

big
  :: forall lock payload
   . AnEvent M (Attribute Big_)
  -> Array (Domable lock payload)
  -> Domable lock payload
big attributes kids = Element' (elementify "big" attributes (fixed kids))

big_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
big_ = big empty

