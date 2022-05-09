module Deku.DOM.Elt.Figure where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Figure_

figure
  :: forall lock payload
   . Event (Attribute Figure_)
  -> Array (Domable lock payload)
  -> Domable lock payload
figure attributes kids = Element' (elementify "figure" attributes (FixedChildren' (FixedChildren kids)))

figure_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
figure_ = figure empty

