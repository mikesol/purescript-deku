module Deku.DOM.Elt.Style where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Style_

style
  :: forall event payload
   . IsEvent event
  => event (Attribute Style_)
  -> Array (Element event payload)
  -> Element event payload
style = elementify "style"

style_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
style_ = style empty
