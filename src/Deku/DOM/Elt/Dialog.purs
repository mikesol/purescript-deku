module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Dialog_

dialog
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Dialog_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
dialog attributes kids = Element' (elementify "dialog" attributes (fixed kids))

dialog_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
dialog_ = dialog empty

