module Deku.DOM.Elt.Datalist where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Datalist_

datalist
  :: forall lock payload
   . Event (Attribute Datalist_)
  -> Array (Domable lock payload)
  -> Domable lock payload
datalist attributes kids = Domable (Element' (elementify "datalist" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

datalist_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
datalist_ = datalist empty

