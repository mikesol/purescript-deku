module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Ruby_

ruby
  :: forall lock payload
   . AnEvent Zora (Attribute Ruby_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ruby attributes kids = Element' (elementify "ruby" attributes (fixed kids))

ruby_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ruby_ = ruby empty

