module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Body_

body
  :: forall lock payload
   . Event (Attribute Body_)
  -> Array (Domable lock payload)
  -> Domable lock payload
body attributes kids = Element' (elementify "body" attributes (FixedChildren' (FixedChildren kids)))

body_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
body_ = body empty

