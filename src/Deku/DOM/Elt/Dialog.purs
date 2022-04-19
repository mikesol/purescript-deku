module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Dialog_

dialog
  :: forall event payload
   . IsEvent event
  => event (Attribute Dialog_)
  -> Array (Element event payload)
  -> Element event payload
dialog = elementify "dialog"

dialog_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
dialog_ = dialog empty
