module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data Template_

template
  :: Array (Attribute Template_)
  -> Array Nut
  -> Nut
template = DC.elementify2 "template"

template_
  :: Array Nut
  -> Nut
template_ = template empty

template__
  :: String
  -> Nut
template__ t = template_ [ DC.text_ t ]
