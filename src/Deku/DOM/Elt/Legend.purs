module Deku.DOM.Elt.Legend where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Legend_

legend
  :: forall lock payload
   . Event (Attribute Legend_)
  -> Array (Domable lock payload)
  -> Domable lock payload
legend attributes kids = Element' (elementify "legend" attributes (FixedChildren' (FixedChildren kids)))

legend_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
legend_ = legend empty

