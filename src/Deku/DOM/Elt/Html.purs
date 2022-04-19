module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Html_

html
  :: forall event payload
   . IsEvent event
  => event (Attribute Html_)
  -> Array (Element event payload)
  -> Element event payload
html = elementify "html"

html_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
html_ = html empty
