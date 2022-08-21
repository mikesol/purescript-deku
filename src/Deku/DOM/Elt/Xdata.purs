module Deku.DOM.Elt.Xdata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Xdata_

xdata
  :: forall lock payload
   . AnEvent Zora (Attribute Xdata_)
  -> Array (Domable lock payload)
  -> Domable lock payload
xdata attributes kids = Element' (elementify "data" attributes (fixed kids))

xdata_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
xdata_ = xdata empty

