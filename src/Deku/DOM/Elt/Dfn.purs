module Deku.DOM.Elt.Dfn where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Dfn_

dfn
  :: forall lock payload
   . AnEvent Zora (Attribute Dfn_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dfn attributes kids = Element' (elementify "dfn" attributes (fixed kids))

dfn_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dfn_ = dfn empty

