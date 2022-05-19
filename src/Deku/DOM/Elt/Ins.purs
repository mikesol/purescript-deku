module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Ins_

ins
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Ins_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
ins attributes kids = Element' (elementify "ins" attributes (fixed kids))

ins_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
ins_ = ins empty

