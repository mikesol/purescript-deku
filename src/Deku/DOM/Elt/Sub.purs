module Deku.DOM.Elt.Sub where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Sub_

sub
  :: forall lock payload
   . AnEvent M (Attribute Sub_)
  -> Array (Domable lock payload)
  -> Domable lock payload
sub attributes kids = Element' (elementify "sub" attributes (fixed kids))

sub_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
sub_ = sub empty

