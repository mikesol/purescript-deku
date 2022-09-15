module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Cite_

cite
  :: forall lock payload
   . Event (Attribute Cite_)
  -> Array (Domable lock payload)
  -> Domable lock payload
cite attributes kids = Domable (Element' (elementify "cite" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

cite_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
cite_ = cite empty

