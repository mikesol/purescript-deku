module Deku.DOM.Elt.Thead where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Thead_

thead
  :: forall lock payload
   . Event (Attribute Thead_)
  -> Array (Domable lock payload)
  -> Domable lock payload
thead attributes kids = Domable (Element' (elementify "thead" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

thead_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
thead_ = thead empty

