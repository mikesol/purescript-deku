module Deku.DOM.Elt.Tr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Tr_

tr
  :: forall lock payload
   . Event (Attribute Tr_)
  -> Array (Domable lock payload)
  -> Domable lock payload
tr attributes kids = Element' (elementify "tr" attributes (fixed kids))

tr_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
tr_ = tr empty

