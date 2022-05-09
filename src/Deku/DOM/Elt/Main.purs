module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Main_

main
  :: forall lock payload
   . Event (Attribute Main_)
  -> Array (Domable lock payload)
  -> Domable lock payload
main attributes kids = Element' (elementify "main" attributes (FixedChildren' (FixedChildren kids)))

main_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
main_ = main empty

