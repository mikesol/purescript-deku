module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Ruby_

ruby
  :: forall lock payload
   . Event (Attribute Ruby_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ruby attributes kids = Element' (elementify "ruby" attributes (FixedChildren' (FixedChildren kids)))

ruby_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ruby_ = ruby empty

