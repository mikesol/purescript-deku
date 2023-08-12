module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Main_

main
  :: Array (Event (Attribute Main_))
  -> Array Nut
  -> Nut
main = DC.elementify2 "main"

main_
  :: Array Nut
  -> Nut
main_ = main empty

main__
  :: String
  -> Nut
main__ t = main_ [ DC.text_ t ]
