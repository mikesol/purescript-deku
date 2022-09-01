module Deku.DOM.Elt.Del where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Del_

del
  :: forall lock payload
   . Event (Attribute Del_)
  -> Array (Domable lock payload)
  -> Domable lock payload
del attributes kids = Element' (elementify "del" attributes (fixed kids))

del_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
del_ = del empty

