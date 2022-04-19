module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Noframes_

noframes
  :: forall event payload
   . IsEvent event
  => event (Attribute Noframes_)
  -> Array (Element event payload)
  -> Element event payload
noframes = elementify "noframes"

noframes_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
noframes_ = noframes empty
