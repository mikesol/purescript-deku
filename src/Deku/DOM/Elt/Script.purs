module Deku.DOM.Elt.Script where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

script
  :: Array (Event (Attribute Tags.Script_))
  -> Array Nut
  -> Nut
script = DC.elementify3 "script"

script_
  :: Array Nut
  -> Nut
script_ = script empty

script__
  :: String
  -> Nut
script__ t = script_ [ DC.text_ t ]
