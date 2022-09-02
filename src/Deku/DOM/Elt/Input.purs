module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Input_

input
  :: forall lock payload
   . Event (Attribute Input_)
  -> Array (Domable lock payload)
  -> Domable lock payload
input attributes kids = Element' (elementify "input" attributes (fixed kids))

input_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
input_ = input empty

