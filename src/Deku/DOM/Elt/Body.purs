module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Body_

body
  :: Event (Attribute Body_)
  -> Array Domable
  -> Domable
body = DC.elementify2 "body"

body_
  :: Array Domable
  -> Domable
body_ = body empty

body__
  :: String
  -> Domable
body__ t = body_ [ DC.text_ t ]
