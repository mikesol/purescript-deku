module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Title_

title
  :: forall lock payload
   . AnEvent M (Attribute Title_)
  -> Array (Domable lock payload)
  -> Domable lock payload
title attributes kids = Element' (elementify "title" attributes (fixed kids))

title_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
title_ = title empty

