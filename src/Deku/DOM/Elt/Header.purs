module Deku.DOM.Elt.Header where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Header_

header
  :: forall lock payload
   . AnEvent M (Attribute Header_)
  -> Array (Domable lock payload)
  -> Domable lock payload
header attributes kids = Element' (elementify "header" attributes (fixed kids))

header_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
header_ = header empty

