module Deku.DOM.Elt.Base where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Base_

base
  :: forall lock payload
   . Event (Attribute Base_)
  -> Array (Domable lock payload)
  -> Domable lock payload
base attributes kids = Domable (Element' (elementify "base" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

base_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
base_ = base empty

