module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Dialog_

dialog
  :: Array (Poll (Attribute Dialog_))
  -> Array Nut
  -> Nut
dialog = DC.elementify2 "dialog"

dialog_
  :: Array Nut
  -> Nut
dialog_ = dialog empty

dialog__
  :: String
  -> Nut
dialog__ t = dialog_ [ DC.text t ]
