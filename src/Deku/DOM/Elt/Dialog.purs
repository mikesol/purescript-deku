module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Dialog_

dialog
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Dialog_)
  -> seed
  -> Element lock payload
dialog attributes seed = elementify "dialog" attributes (plant seed)

dialog_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
dialog_ = dialog empty

