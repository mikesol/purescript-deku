module Deku.DOM.Elt.Button where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Button_

button
  :: forall lock payload
   . Event (Attribute Button_)
  -> Array (Domable lock payload)
  -> Domable lock payload
button attributes kids = Element' (elementify "button" attributes (FixedChildren' (FixedChildren kids)))

button_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
button_ = button empty

