module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

body
  :: Array (Attribute Tags.Body_)
  -> Array Nut
  -> Nut
body = DC.elementify3 "body"

body_
  :: Array Nut
  -> Nut
body_ = body empty

body__
  :: String
  -> Nut
body__ t = body_ [ DC.text_ t ]
