module Deku.DOM.Elt.Dfn where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Dfn_

dfn
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Dfn_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
dfn attributes kids = Element' (elementify "dfn" attributes (fixed kids))

dfn_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
dfn_ = dfn empty

