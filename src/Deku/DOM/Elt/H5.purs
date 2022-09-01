module Deku.DOM.Elt.H5 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data H5_

h5
  :: forall lock payload
   . Event (Attribute H5_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h5 attributes kids = Element' (elementify "h5" attributes (fixed kids))

h5_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h5_ = h5 empty

