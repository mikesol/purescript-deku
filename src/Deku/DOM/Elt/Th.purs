module Deku.DOM.Elt.Th where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Th_

th
  :: forall lock payload
   . Event (Attribute Th_)
  -> Array (Domable lock payload)
  -> Domable lock payload
th attributes kids = Element' (elementify "th" attributes (fixed kids))

th_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
th_ = th empty

