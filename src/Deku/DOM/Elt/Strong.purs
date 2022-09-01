module Deku.DOM.Elt.Strong where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Strong_

strong
  :: forall lock payload
   . Event (Attribute Strong_)
  -> Array (Domable lock payload)
  -> Domable lock payload
strong attributes kids = Element' (elementify "strong" attributes (fixed kids))

strong_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
strong_ = strong empty

