module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data Main_

main
  :: Array (Attribute Main_)
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
