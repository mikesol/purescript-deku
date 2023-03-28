module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Kbd_

kbd
  :: Event (Attribute Kbd_)
  -> Array Domable
  -> Domable
kbd = DC.elementify2 "kbd"

kbd_
  :: Array Domable
  -> Domable
kbd_ = kbd empty

kbd__
  :: String
  -> Domable
kbd__ t = kbd_ [ DC.text_ t ]
