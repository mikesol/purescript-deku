module Deku.DOM.Elt.Link where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Link_

link
  :: forall lock payload
   . AnEvent Zora (Attribute Link_)
  -> Array (Domable lock payload)
  -> Domable lock payload
link attributes kids = Element' (elementify "link" attributes (fixed kids))

link_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
link_ = link empty

