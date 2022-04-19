module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Var_

var
  :: forall event payload
   . IsEvent event
  => event (Attribute Var_)
  -> Array (Element event payload)
  -> Element event payload
var = elementify "var"

var_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
var_ = var empty
