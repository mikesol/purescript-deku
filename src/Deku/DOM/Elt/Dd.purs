module Deku.DOM.Elt.Dd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Dd_

dd
  :: forall lock payload
   . AnEvent Zora (Attribute Dd_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dd attributes kids = Element' (elementify "dd" attributes (fixed kids))

dd_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dd_ = dd empty

