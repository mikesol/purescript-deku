module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Dialog_

dialog
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Dialog_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
dialog attributes kids = Element' (elementify "dialog" attributes (fixed kids))

dialog_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
dialog_ = dialog empty

