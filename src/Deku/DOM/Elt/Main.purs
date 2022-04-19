module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Main_

main
  :: forall event payload
   . IsEvent event
  => event (Attribute Main_)
  -> Array (Element event payload)
  -> Element event payload
main = elementify "main"

main_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
main_ = main empty
