module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Ins_

ins
  :: forall lock payload
   . AnEvent Zora (Attribute Ins_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ins attributes kids = Element' (elementify "ins" attributes (fixed kids))

ins_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ins_ = ins empty

