module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Title_

title
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Title_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
title attributes kids = Element' (elementify "title" attributes (fixed kids))

title_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
title_ = title empty

