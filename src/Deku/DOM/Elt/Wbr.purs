module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Wbr_

wbr
  :: forall lock payload
   . Event (Attribute Wbr_)
  -> Array (Domable lock payload)
  -> Domable lock payload
wbr attributes kids = Element' (elementify "wbr" attributes (fixed kids))

wbr_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
wbr_ = wbr empty

