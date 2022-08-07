module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Ruby_

ruby
  :: forall lock payload
   . AnEvent M (Attribute Ruby_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ruby attributes kids = Element' (elementify "ruby" attributes (fixed kids))

ruby_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ruby_ = ruby empty

