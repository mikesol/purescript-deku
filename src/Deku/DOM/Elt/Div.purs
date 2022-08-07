module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Div_

div
  :: forall lock payload
   . AnEvent M (Attribute Div_)
  -> Array (Domable lock payload)
  -> Domable lock payload
div attributes kids = Element' (elementify "div" attributes (fixed kids))

div_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
div_ = div empty

