module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data Footer_

footer
  :: Array (Attribute Footer_)
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
