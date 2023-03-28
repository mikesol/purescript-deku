module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Footer_

footer
  :: Event (Attribute Footer_)
  -> Array Domable
  -> Domable
footer = DC.elementify2 "footer"

footer_
  :: Array Domable
  -> Domable
footer_ = footer empty

footer__
  :: String
  -> Domable
footer__ t = footer_ [ DC.text_ t ]
