module Deku.DOM.Elt.Textarea where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Textarea_

textarea
  :: Array (Event (Attribute Textarea_))
  -> Array Nut
  -> Nut
textarea = DC.elementify2 "textarea"

textarea_
  :: Array Nut
  -> Nut
textarea_ = textarea empty

textarea__
  :: String
  -> Nut
textarea__ t = textarea_ [ DC.text_ t ]
