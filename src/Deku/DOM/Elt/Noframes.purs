module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Noframes_

noframes
  :: forall lock payload
   . Event (Attribute Noframes_)
  -> Array (Domable lock payload)
  -> Domable lock payload
noframes attributes kids = Element' (elementify "noframes" attributes (fixed kids))

noframes_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
noframes_ = noframes empty

