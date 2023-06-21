module Deku.DOM.Elt.Sub where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

sub
  :: Array (Attribute Tags.Sub_)
  -> Array Nut
  -> Nut
sub = DC.elementify3 "sub"

sub_
  :: Array Nut
  -> Nut
sub_ = sub empty

sub__
  :: String
  -> Nut
sub__ t = sub_ [ DC.text_ t ]
