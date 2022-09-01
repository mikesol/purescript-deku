module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Ins_

ins
  :: forall lock payload
   . Event (Attribute Ins_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ins attributes kids = Element' (elementify "ins" attributes (fixed kids))

ins_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ins_ = ins empty

