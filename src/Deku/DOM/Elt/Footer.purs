module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Footer_

footer
  :: forall lock payload
   . Event (Attribute Footer_)
  -> Array (Domable lock payload)
  -> Domable lock payload
footer attributes kids = Domable (Element' (elementify "footer" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

footer_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
footer_ = footer empty

