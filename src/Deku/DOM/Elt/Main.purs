module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

main
  :: Array (Attribute Tags.Main_)
  -> Array Nut
  -> Nut
main = DC.elementify3 "main"

main_
  :: Array Nut
  -> Nut
main_ = main empty

main__
  :: String
  -> Nut
main__ t = main_ [ DC.text_ t ]
