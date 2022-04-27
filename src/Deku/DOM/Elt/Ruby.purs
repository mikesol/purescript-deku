module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Ruby_

ruby
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Ruby_)
  -> seed
  -> Element lock payload
ruby attributes seed = elementify "ruby" attributes (plant seed)

ruby_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
ruby_ = ruby empty

