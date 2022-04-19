module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Ruby_

ruby
  :: forall event payload
   . IsEvent event
  => event (Attribute Ruby_)
  -> Array (Element event payload)
  -> Element event payload
ruby = elementify "ruby"

ruby_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
ruby_ = ruby empty
