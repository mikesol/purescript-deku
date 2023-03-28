module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Template_

template
  :: Event (Attribute Template_)
  -> Array Domable
  -> Domable
template = DC.elementify2 "template"

template_
  :: Array Domable
  -> Domable
template_ = template empty

template__
  :: String
  -> Domable
template__ t = template_ [ DC.text_ t ]
