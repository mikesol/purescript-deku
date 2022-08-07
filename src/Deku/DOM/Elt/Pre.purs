module Deku.DOM.Elt.Pre where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Pre_

pre
  :: forall lock payload
   . AnEvent M (Attribute Pre_)
  -> Array (Domable lock payload)
  -> Domable lock payload
pre attributes kids = Element' (elementify "pre" attributes (fixed kids))

pre_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
pre_ = pre empty

