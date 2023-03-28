module Deku.DOM.Elt.Sub where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Sub_

sub
  :: Event (Attribute Sub_)
  -> Array Domable
  -> Domable
sub = DC.elementify2 "sub"

sub_
  :: Array Domable
  -> Domable
sub_ = sub empty

sub__
  :: String
  -> Domable
sub__ t = sub_ [ DC.text_ t ]
