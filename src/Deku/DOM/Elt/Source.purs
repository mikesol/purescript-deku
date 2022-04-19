module Deku.DOM.Elt.Source where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Source_

source
  :: forall event payload
   . IsEvent event
  => event (Attribute Source_)
  -> Array (Element event payload)
  -> Element event payload
source = elementify "source"

source_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
source_ = source empty
