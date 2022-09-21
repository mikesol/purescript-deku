module Deku.DOM.Elt.Textarea where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Textarea_

textarea
  :: forall lock payload
   . Event (Attribute Textarea_)
  -> Array (Domable lock payload)
  -> Domable lock payload
textarea attributes kids = Domable (Element' (elementify "textarea" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

textarea_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
textarea_ = textarea empty

