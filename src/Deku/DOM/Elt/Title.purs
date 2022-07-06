module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Title_

title
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Title_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
title attributes kids = Element' (elementify "title" attributes (fixed kids))

title_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
title_ = title empty

