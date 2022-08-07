module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Input_

input
  :: forall lock payload
   . AnEvent M (Attribute Input_)
  -> Array (Domable lock payload)
  -> Domable lock payload
input attributes kids = Element' (elementify "input" attributes (fixed kids))

input_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
input_ = input empty

