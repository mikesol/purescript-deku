module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Dialog_

dialog
  :: forall lock payload
   . Event (Attribute Dialog_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dialog attributes kids = Element' (elementify "dialog" attributes (FixedChildren' (FixedChildren kids)))

dialog_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dialog_ = dialog empty

