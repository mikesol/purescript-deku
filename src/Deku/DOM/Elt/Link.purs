module Deku.DOM.Elt.Link where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Link_

link
  :: forall lock payload
   . Event (Attribute Link_)
  -> Array (Domable lock payload)
  -> Domable lock payload
link attributes kids = Domable (Element' (elementify "link" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

link_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
link_ = link empty

