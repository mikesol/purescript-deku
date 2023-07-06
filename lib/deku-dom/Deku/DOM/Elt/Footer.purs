module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Footer_

footer
  :: Array (Event (Attribute Footer_))
  -> Array Nut
  -> Nut
footer = DC.elementify2 "footer"

footer_
  :: Array Nut
  -> Nut
footer_ = footer empty

footer__
  :: String
  -> Nut
footer__ t = footer_ [ DC.text_ t ]
