module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Footer_

footer
  :: forall lock payload
   . Event (Attribute Footer_)
  -> Array (Domable lock payload)
  -> Domable lock payload
footer attributes kids = Element' (elementify "footer" attributes (FixedChildren' (FixedChildren kids)))

footer_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
footer_ = footer empty

