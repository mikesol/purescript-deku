module Deku.DOM.Elt.Textarea where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Textarea_

textarea
  :: Event (Attribute Textarea_)
  -> Array Domable
  -> Domable
textarea = DC.elementify2 "textarea"

textarea_
  :: Array Domable
  -> Domable
textarea_ = textarea empty

textarea__
  :: String
  -> Domable
textarea__ t = textarea_ [ DC.text_ t ]
