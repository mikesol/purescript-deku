module Deku.DOM.Elt.Sub where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Sub_

sub
  :: Array (Event (Attribute Sub_))
  -> Array Nut
  -> Nut
sub = DC.elementify2 "sub"

sub_
  :: Array Nut
  -> Nut
sub_ = sub empty

sub__
  :: String
  -> Nut
sub__ t = sub_ [ DC.text_ t ]
