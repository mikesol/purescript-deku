module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Ins_

ins
  :: forall event payload
   . IsEvent event
  => event (Attribute Ins_)
  -> Array (Element event payload)
  -> Element event payload
ins = elementify "ins"

ins_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
ins_ = ins empty
