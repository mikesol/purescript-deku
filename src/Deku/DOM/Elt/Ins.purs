module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Ins_

ins
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Ins_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
ins attributes kids = Element' (elementify "ins" attributes (fixed kids))

ins_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
ins_ = ins empty

