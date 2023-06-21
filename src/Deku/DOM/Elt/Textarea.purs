module Deku.DOM.Elt.Textarea where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

textarea
  :: Array (Event (Attribute Tags.Textarea_))
  -> Array Nut
  -> Nut
textarea = DC.elementify3 "textarea"

textarea_
  :: Array Nut
  -> Nut
textarea_ = textarea empty

textarea__
  :: String
  -> Nut
textarea__ t = textarea_ [ DC.text_ t ]
