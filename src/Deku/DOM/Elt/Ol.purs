module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Ol_

ol
  :: forall lock payload
   . Event (Attribute Ol_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ol attributes kids = Domable (Element' (elementify "ol" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

ol_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ol_ = ol empty

