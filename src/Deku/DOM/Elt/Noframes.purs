module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

noframes
  :: Array (Attribute Tags.Noframes_)
  -> Array Nut
  -> Nut
noframes = DC.elementify3 "noframes"

noframes_
  :: Array Nut
  -> Nut
noframes_ = noframes empty

noframes__
  :: String
  -> Nut
noframes__ t = noframes_ [ DC.text_ t ]
