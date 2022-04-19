module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Kbd_

kbd
  :: forall event payload
   . IsEvent event
  => event (Attribute Kbd_)
  -> Array (Element event payload)
  -> Element event payload
kbd = elementify "kbd"

kbd_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
kbd_ = kbd empty
