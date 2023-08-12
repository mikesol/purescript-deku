module Deku.DOM.Elt.Form where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Form_

form
  :: Array (Event (Attribute Form_))
  -> Array Nut
  -> Nut
form = DC.elementify2 "form"

form_
  :: Array Nut
  -> Nut
form_ = form empty

form__
  :: String
  -> Nut
form__ t = form_ [ DC.text_ t ]
