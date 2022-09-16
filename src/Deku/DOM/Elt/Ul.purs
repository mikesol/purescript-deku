module Deku.DOM.Elt.Ul where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Ul_

ul
  :: forall lock payload
   . Event (Attribute Ul_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ul attributes kids = Domable (Element' (elementify "ul" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

ul_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ul_ = ul empty

