module Deku.DOM.Elt.Form where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

form
  :: Array (Attribute Tags.Form_)
  -> Array Nut
  -> Nut
form = DC.elementify3 "form"

form_
  :: Array Nut
  -> Nut
form_ = form empty

form__
  :: String
  -> Nut
form__ t = form_ [ DC.text_ t ]
