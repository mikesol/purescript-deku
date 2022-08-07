module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Footer_

footer
  :: forall lock payload
   . AnEvent M (Attribute Footer_)
  -> Array (Domable lock payload)
  -> Domable lock payload
footer attributes kids = Element' (elementify "footer" attributes (fixed kids))

footer_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
footer_ = footer empty

