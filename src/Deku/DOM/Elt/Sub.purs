module Deku.DOM.Elt.Sub where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Sub_

sub
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Sub_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
sub attributes kids = Element' (elementify "sub" attributes (fixed kids))

sub_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
sub_ = sub empty

