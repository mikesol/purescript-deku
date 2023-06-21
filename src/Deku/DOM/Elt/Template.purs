module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

template
  :: Array (Event (Attribute Tags.Template_))
  -> Array Nut
  -> Nut
template = DC.elementify3 "template"

template_
  :: Array Nut
  -> Nut
template_ = template empty

template__
  :: String
  -> Nut
template__ t = template_ [ DC.text_ t ]
