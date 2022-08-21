module Deku.DOM.Elt.Figure where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Figure_

figure
  :: forall lock payload
   . AnEvent Zora (Attribute Figure_)
  -> Array (Domable lock payload)
  -> Domable lock payload
figure attributes kids = Element' (elementify "figure" attributes (fixed kids))

figure_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
figure_ = figure empty

