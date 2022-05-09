module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Input_

input
  :: forall lock payload
   . Event (Attribute Input_)
  -> Array (Domable lock payload)
  -> Domable lock payload
input attributes kids = Element' (elementify "input" attributes (FixedChildren' (FixedChildren kids)))

input_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
input_ = input empty

