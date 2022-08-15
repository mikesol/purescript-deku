module Deku.DOM.Elt.Meta where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Meta_

meta
  :: forall lock payload
   . AnEvent Zora (Attribute Meta_)
  -> Array (Domable lock payload)
  -> Domable lock payload
meta attributes kids = Element' (elementify "meta" attributes (fixed kids))

meta_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
meta_ = meta empty

