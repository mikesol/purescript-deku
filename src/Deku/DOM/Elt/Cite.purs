module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Cite_

cite
  :: forall lock payload
   . AnEvent Zora (Attribute Cite_)
  -> Array (Domable lock payload)
  -> Domable lock payload
cite attributes kids = Element' (elementify "cite" attributes (fixed kids))

cite_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
cite_ = cite empty

