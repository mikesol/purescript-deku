module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

footer
  :: Array (Attribute Tags.Footer_)
  -> Array Nut
  -> Nut
footer = DC.elementify3 "footer"

footer_
  :: Array Nut
  -> Nut
footer_ = footer empty

footer__
  :: String
  -> Nut
footer__ t = footer_ [ DC.text_ t ]
