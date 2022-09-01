module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Bdi_

bdi
  :: forall lock payload
   . Event (Attribute Bdi_)
  -> Array (Domable lock payload)
  -> Domable lock payload
bdi attributes kids = Element' (elementify "bdi" attributes (fixed kids))

bdi_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
bdi_ = bdi empty

