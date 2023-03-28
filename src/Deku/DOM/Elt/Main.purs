module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Main_

main
  :: Event (Attribute Main_)
  -> Array Domable
  -> Domable
main = DC.elementify2 "main"

main_
  :: Array Domable
  -> Domable
main_ = main empty

main__
  :: String
  -> Domable
main__ t = main_ [ DC.text_ t ]
