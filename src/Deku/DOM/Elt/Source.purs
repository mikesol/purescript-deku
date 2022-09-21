module Deku.DOM.Elt.Source where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Source_

source
  :: forall lock payload
   . Event (Attribute Source_)
  -> Array (Domable lock payload)
  -> Domable lock payload
source attributes kids = Domable (Element' (elementify "source" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

source_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
source_ = source empty

