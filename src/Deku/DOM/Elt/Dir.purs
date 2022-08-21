module Deku.DOM.Elt.Dir where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Dir_

dir
  :: forall lock payload
   . AnEvent Zora (Attribute Dir_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dir attributes kids = Element' (elementify "dir" attributes (fixed kids))

dir_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dir_ = dir empty

