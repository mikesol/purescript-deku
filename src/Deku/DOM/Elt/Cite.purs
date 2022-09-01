module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Cite_

cite
  :: forall lock payload
   . Event (Attribute Cite_)
  -> Array (Domable lock payload)
  -> Domable lock payload
cite attributes kids = Element' (elementify "cite" attributes (fixed kids))

cite_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
cite_ = cite empty

