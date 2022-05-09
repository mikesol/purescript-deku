module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Canvas_

canvas
  :: forall lock payload
   . Event (Attribute Canvas_)
  -> Array (Domable lock payload)
  -> Domable lock payload
canvas attributes kids = Element' (elementify "canvas" attributes (FixedChildren' (FixedChildren kids)))

canvas_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
canvas_ = canvas empty

