module Deku.DOM.Elt.Colgroup where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Colgroup_

colgroup
  :: forall lock payload
   . Event (Attribute Colgroup_)
  -> Array (Domable lock payload)
  -> Domable lock payload
colgroup attributes kids = Domable (Element' (elementify "colgroup" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

colgroup_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
colgroup_ = colgroup empty

