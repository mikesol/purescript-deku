module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

dialog
  :: Array (Attribute Tags.Dialog_)
  -> Array Nut
  -> Nut
dialog = DC.elementify3 "dialog"

dialog_
  :: Array Nut
  -> Nut
dialog_ = dialog empty

dialog__
  :: String
  -> Nut
dialog__ t = dialog_ [ DC.text_ t ]
