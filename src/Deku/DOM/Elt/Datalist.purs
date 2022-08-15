module Deku.DOM.Elt.Datalist where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Datalist_

datalist
  :: forall lock payload
   . AnEvent Zora (Attribute Datalist_)
  -> Array (Domable lock payload)
  -> Domable lock payload
datalist attributes kids = Element' (elementify "datalist" attributes (fixed kids))

datalist_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
datalist_ = datalist empty

