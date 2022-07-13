module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Abbr_

abbr
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Abbr_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
abbr attributes kids = Element' (elementify "abbr" attributes (fixed kids))

abbr_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
abbr_ = abbr empty

