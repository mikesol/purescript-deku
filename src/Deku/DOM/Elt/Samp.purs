module Deku.DOM.Elt.Samp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Samp_

samp
  :: forall lock payload
   . AnEvent Zora (Attribute Samp_)
  -> Array (Domable lock payload)
  -> Domable lock payload
samp attributes kids = Element' (elementify "samp" attributes (fixed kids))

samp_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
samp_ = samp empty

