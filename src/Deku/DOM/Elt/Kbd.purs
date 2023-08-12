module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Kbd_

kbd
  :: Array (Poll (Attribute Kbd_))
  -> Array Nut
  -> Nut
kbd = DC.elementify2 "kbd"

kbd_
  :: Array Nut
  -> Nut
kbd_ = kbd empty

kbd__
  :: String
  -> Nut
kbd__ t = kbd_ [ DC.text t ]
