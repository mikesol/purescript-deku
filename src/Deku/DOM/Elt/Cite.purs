module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Cite_

cite
  :: forall lock payload
   . AnEvent M (Attribute Cite_)
  -> Array (Domable lock payload)
  -> Domable lock payload
cite attributes kids = Element' (elementify "cite" attributes (fixed kids))

cite_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
cite_ = cite empty

