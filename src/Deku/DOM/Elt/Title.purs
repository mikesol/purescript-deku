module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Title_

title
  :: forall lock payload
   . AnEvent Zora (Attribute Title_)
  -> Array (Domable lock payload)
  -> Domable lock payload
title attributes kids = Element' (elementify "title" attributes (fixed kids))

title_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
title_ = title empty

