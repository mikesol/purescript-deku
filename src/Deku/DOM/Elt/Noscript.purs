module Deku.DOM.Elt.Noscript where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Noscript_

noscript
  :: forall lock payload
   . Event (Attribute Noscript_)
  -> Array (Domable lock payload)
  -> Domable lock payload
noscript attributes kids = Domable (Element' (elementify "noscript" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

noscript_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
noscript_ = noscript empty

