module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

kbd
  :: Array (Event (Attribute Tags.Kbd_))
  -> Array Nut
  -> Nut
kbd = DC.elementify3 "kbd"

kbd_
  :: Array Nut
  -> Nut
kbd_ = kbd empty

kbd__
  :: String
  -> Nut
kbd__ t = kbd_ [ DC.text_ t ]
