module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Iframe_

iframe
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Iframe_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
iframe attributes kids = Element' (elementify "iframe" attributes (fixed kids))

iframe_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
iframe_ = iframe empty

