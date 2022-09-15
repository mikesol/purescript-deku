module Deku.DOM.Elt.Embed where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Embed_

embed
  :: forall lock payload
   . Event (Attribute Embed_)
  -> Array (Domable lock payload)
  -> Domable lock payload
embed attributes kids = Domable (Element' (elementify "embed" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

embed_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
embed_ = embed empty

