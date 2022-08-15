module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Br_

br
  :: forall lock payload
   . AnEvent Zora (Attribute Br_)
  -> Array (Domable lock payload)
  -> Domable lock payload
br attributes kids = Element' (elementify "br" attributes (fixed kids))

br_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
br_ = br empty

