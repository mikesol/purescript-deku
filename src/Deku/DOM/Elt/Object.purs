module Deku.DOM.Elt.Object where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Object_

object
  :: forall lock payload
   . Event (Attribute Object_)
  -> Array (Domable lock payload)
  -> Domable lock payload
object attributes kids = Domable (Element' (elementify "object" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

object_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
object_ = object empty

