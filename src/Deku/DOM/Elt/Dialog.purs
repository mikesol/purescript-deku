module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Dialog_

dialog
  :: Event (Attribute Dialog_)
  -> Array Domable
  -> Domable
dialog = DC.elementify2 "dialog"

dialog_
  :: Array Domable
  -> Domable
dialog_ = dialog empty

dialog__
  :: String
  -> Domable
dialog__ t = dialog_ [ DC.text_ t ]
