module Deku.DOM.Elt.Dfn where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Dfn_

dfn
  :: forall lock payload
   . Event (Attribute Dfn_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dfn attributes kids = Domable (Element' (elementify "dfn" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

dfn_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dfn_ = dfn empty

