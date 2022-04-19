module Deku.DOM.Elt.Script where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Script_

script
  :: forall event payload
   . IsEvent event
  => event (Attribute Script_)
  -> Array (Element event payload)
  -> Element event payload
script = elementify "script"

script_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
script_ = script empty
