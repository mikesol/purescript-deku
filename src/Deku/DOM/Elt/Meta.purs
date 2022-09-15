module Deku.DOM.Elt.Meta where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Meta_

meta
  :: forall lock payload
   . Event (Attribute Meta_)
  -> Array (Domable lock payload)
  -> Domable lock payload
meta attributes kids = Domable (Element' (elementify "meta" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

meta_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
meta_ = meta empty

