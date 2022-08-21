module Deku.DOM.Elt.Ul where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Ul_

ul
  :: forall lock payload
   . AnEvent Zora (Attribute Ul_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ul attributes kids = Element' (elementify "ul" attributes (fixed kids))

ul_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ul_ = ul empty

