module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Code_

code
  :: forall event payload
   . IsEvent event
  => event (Attribute Code_)
  -> Array (Element event payload)
  -> Element event payload
code = elementify "code"

code_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
code_ = code empty
