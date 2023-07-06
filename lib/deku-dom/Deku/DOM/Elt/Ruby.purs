module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Ruby_

ruby
  :: Array (Event (Attribute Ruby_))
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
ruby__ t = ruby_ [ DC.text_ t ]
