module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Dialog_

dialog
  :: forall lock payload
   . Event (Attribute Dialog_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dialog attributes kids = Element' (elementify "dialog" attributes (fixed kids))

dialog_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dialog_ = dialog empty

