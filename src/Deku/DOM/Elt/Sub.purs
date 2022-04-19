module Deku.DOM.Elt.Sub where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Sub_

sub
  :: forall event payload
   . IsEvent event
  => event (Attribute Sub_)
  -> Array (Element event payload)
  -> Element event payload
sub = elementify "sub"

sub_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
sub_ = sub empty
