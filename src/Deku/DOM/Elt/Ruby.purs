module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Ruby_

ruby
  :: Event (Attribute Ruby_)
  -> Array Domable
  -> Domable
ruby = DC.elementify2 "ruby"

ruby_
  :: Array Domable
  -> Domable
ruby_ = ruby empty

ruby__
  :: String
  -> Domable
ruby__ t = ruby_ [ DC.text_ t ]
