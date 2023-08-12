module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Ruby_

ruby
  :: Array (Poll (Attribute Ruby_))
  -> Array Nut
  -> Nut
ruby = DC.elementify2 "ruby"

ruby_
  :: Array Nut
  -> Nut
ruby_ = ruby empty

ruby__
  :: String
  -> Nut
ruby__ t = ruby_ [ DC.text t ]
