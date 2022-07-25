module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Iframe_

iframe
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Iframe_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
iframe attributes kids = Element' (elementify "iframe" attributes (fixed kids))

iframe_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
iframe_ = iframe empty

