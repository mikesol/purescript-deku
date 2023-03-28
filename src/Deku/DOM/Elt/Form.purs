module Deku.DOM.Elt.Form where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Form_

form
  :: Event (Attribute Form_)
  -> Array Domable
  -> Domable
form = DC.elementify2 "form"

form_
  :: Array Domable
  -> Domable
form_ = form empty

form__
  :: String
  -> Domable
form__ t = form_ [ DC.text_ t ]
