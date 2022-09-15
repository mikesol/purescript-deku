module Deku.DOM.Elt.Figure where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Figure_

figure
  :: forall lock payload
   . Event (Attribute Figure_)
  -> Array (Domable lock payload)
  -> Domable lock payload
figure attributes kids = Domable (Element' (elementify "figure" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

figure_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
figure_ = figure empty

