module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Ol_

ol
  :: forall lock payload
   . AnEvent Zora (Attribute Ol_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ol attributes kids = Element' (elementify "ol" attributes (fixed kids))

ol_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ol_ = ol empty

