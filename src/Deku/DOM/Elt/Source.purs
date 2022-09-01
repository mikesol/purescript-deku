module Deku.DOM.Elt.Source where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Source_

source
  :: forall lock payload
   . Event (Attribute Source_)
  -> Array (Domable lock payload)
  -> Domable lock payload
source attributes kids = Element' (elementify "source" attributes (fixed kids))

source_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
source_ = source empty

