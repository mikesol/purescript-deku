module Deku.DOM.Elt.Sub where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Sub_

sub
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Sub_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
sub attributes kids = Element' (elementify "sub" attributes (fixed kids))

sub_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
sub_ = sub empty

